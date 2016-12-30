class AllocateLockerJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Check if the round is closed
    round = LockerRound.find(args[0])

    if DateTime.now > round.end
      ballots = LockerBallot.in_round(round).order('rand()')
      allocated_users = {}
      unallocated_users = []

      lockers = Locker.allocatable.group_by(&:location)
      ballots.each do |ballot|
        next if LockerAllocation.find_by(user_id: ballot.user.id, status: :active, locker_round_id:round.id)

        unless lockers[ballot.location].nil? or lockers[ballot.location].empty?	
          locker = lockers[ballot.location].shift
          allocation = LockerAllocation.new(user_id: ballot.user.id, locker_id: locker.id, locker_round_id: round.id, status: :active)
          if allocation.save
            ballot.success = true
            ballot.save
            locker.update status: :occupied
            allocated_users[ballot.user] = allocation
          end
        else
          unallocated_users << ballot.user
        end
      end

      # create email lists
      allocated_users_email_list = []
      allocated_users.each { |user, alloc|
        allocated_users_email_list.push user.email
      }

      unallocated_users_email_list = []
      unallocated_users.each { |user|
        unallocated_users_email_list.push user.email
      }

      # notify lockerbot
      LockerNotifier.allocation_complete(round, allocated_users_email_list, unallocated_users_email_list).deliver_later

      # Send mail
      allocated_users.each { |user, alloc|
        LockerNotifier.successful_ballot(user, round, alloc).deliver_later
      }

      unallocated_users.each { |user|
        LockerNotifier.unsuccessful_ballot(user, round).deliver_later
      }
    end
  end
end
