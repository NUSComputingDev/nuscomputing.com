# Preview all emails at http://localhost:3000/rails/mailers/locker_notifier
class LockerNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/locker_notifier/successful_ballot
  def successful_ballot
    LockerNotifier.successful_ballot
  end

  # Preview this email at http://localhost:3000/rails/mailers/locker_notifier/unsuccessful_ballot
  def unsuccessful_ballot
    LockerNotifier.unsuccessful_ballot
  end

end
