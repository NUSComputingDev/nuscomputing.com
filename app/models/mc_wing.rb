class McWing < ActiveRecord::Base
  has_many :mc_members, class_name: 'McMember'
end
