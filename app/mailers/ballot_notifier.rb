class BallotNotifier < ApplicationMailer
  # First define the value for "locker_mail_to" in secrets.yml
  default from: Rails.application.secrets.mailer_username

	def test_email(user)
		@user = user
		mail to: user.email if user.email
  end

  def submitted_ballot_to_user(user, ballot)
    @round = ballot.round
    @user = user
    @ballot = ballot
    mail(to: user.email, reply_to: 'connect@nuscomputing.com', subject: '[Locker Ballot] Ballot Received') if user.email
  end

  def submitted_ballot_to_bot(user, ballot)
    @round = ballot.round
    @user = user
    @ballot = ballot
    mail(to: Rails.application.secrets.locker_mail_to, reply_to: 'connect@nuscomputing.com', subject: '[Locker Ballot] Ballot Received') if user.email
  end
end
