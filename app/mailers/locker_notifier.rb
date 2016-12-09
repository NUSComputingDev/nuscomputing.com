class LockerNotifier < ApplicationMailer
  # First define the value for "locker_mail_to" in secrets.yml
  default from: Rails.application.secrets.mailer_username

  def test_email(user)
    @user = user
    mail to: user.email if user.email
  end

  def test_mail(to_addr)
    mail to: to_addr
  end

  def test_mass_mail(to_addr, count)
    mail to: to_addr, subject: "Mass Mail Number #{count}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.locker_notifier.successful_ballot.subject
  #
  def successful_ballot(user, round, allocation)
    @round = round
    @locker = allocation.locker
    @user = user
    mail(to: user.email, reply_to: 'connect@nuscomputing.com', subject: '[Locker Ballot] Locker Ballot Successful') if user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.locker_notifier.unsuccessful_ballot.subject
  #
  def unsuccessful_ballot(user, round)
    @user = user
    @round = round
    mail(to: user.email, reply_to: 'connect@nuscomputing.com', subject: '[Locker Ballot] Locker Ballot Unsuccessful') if user.email
  end

  def allocation_complete(round, allocated_users, unallocated_users)
    @round = round
    @allocated_users = allocated_users
    @unallocated_users = unallocated_users
    mail(to: Rails.application.secrets.locker_mail_to, reply_to: 'infotech@nuscomputing.com', subject: 'Locker Ballot Allocation Complete')
  end
end
