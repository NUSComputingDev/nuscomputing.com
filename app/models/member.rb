class Member < ActiveRecord::Base
	belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable

	def self.from_omniauth(auth)
		where(email: auth.info['email'], provider: auth.provider).first.tap do |member|
			member.update(uid: auth.uid) unless member.uid
		end
	end
end
