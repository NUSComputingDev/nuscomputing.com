class Enquiry < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
	validates :contact, presence: true, length: 5..13
	validates :message, presence: true
end
