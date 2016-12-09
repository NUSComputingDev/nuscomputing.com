class Mc::LockerController < Mc::BaseController

  def home
    @current_round = LockerRound.active_at(DateTime.now).first
    @last_round = LockerRound.where('end < ?', DateTime.now).order({end: :desc}).first
end

def email
  LockerNotifier.test_email(current_user).deliver_later 
  redirect_to mc_locker_path, notice: "Email sent"
end

def test_single_mail
  receiver = 'ellyoowip@gmail.com'
  LockerNotifier.test_mail(receiver).deliver_later
  redirect_to mc_locker_locker_rounds_path, notice: "Email sent to #{receiver}. Change the receiver address in the code."
end

def test_mass_mail
  receiver = 'ellyoowip@gmail.com'
  500.times do |i|
    LockerNotifier.test_mass_mail(receiver, i).deliver_later
  end
  redirect_to mc_locker_locker_rounds_path, notice: "Email sent to #{receiver}. Change the receiver address in the code."
end
end
