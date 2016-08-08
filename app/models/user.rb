class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable

  validates :name, :uid, :email, :faculty, presence: true
  validates :uid, uniqueness: { case_sensitive: false }

  has_many :requests, class_name: "ItemRequest", dependent: :destroy
  has_many :item_transactions, class_name: "ItemTransaction", through: :requests, dependent: :destroy
  has_many :locker_allocations, dependent: :destroy
  has_many :lockers, through: :locker_allocations

  def current_locker
		locker_allocations.active.first.locker if locker_allocations.active.first
  end

  def uid_and_name
    return "#{self.uid} (#{self.name})"
  end

  def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			# Adding extra information here from the hash returned by Omniauth:IVLE
      user.email = auth.info['email']
      user.name = auth.extra['profile']['Name']
      user.faculty = auth.extra['profile']['Faculty']
      user.first_major = auth.extra['profile']['FirstMajor']
      user.second_major = auth.extra['profile']['SecondMajor']
      user.gender = auth.extra['profile']['Gender']
      user.matriculation_year = auth.extra['profile']['MatriculationYear']
		end
	end
end
