class McMember < ActiveRecord::Base
  belongs_to :mc_wing, class_name: 'McWing', foreign_key: 'wingid'

  validates :name, :position, :wingid, :wingrank, :cellrank, :course, :year, :description, :casualimg, presence: true

  validates :wingid, :numericality => { :greater_than_or_equal_to => 0 }
  validates :wingrank, :numericality => { :greater_than_or_equal_to => 0 }
  validates :cellrank, :numericality => { :greater_than_or_equal_to => 0 }
  validates :year, :numericality => { :greater_than_or_equal_to => 1 }
end
