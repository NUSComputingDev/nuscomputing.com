class Event < ActiveRecord::Base
  before_validation :set_shortlink

  validates :name, :img, :description, presence: true
  validate :link_from_name

  def link_from_name
    if Event.where(link: self.link).where.not(id: self.id).any?
      errors.add(:name, "generates a link that already exists (#{self.link})!")
      return false
    else
      return true
    end
  end

  protected
  def set_shortlink
    self.link = create_shortlink(self.name)
  end

  def create_shortlink(name)
    # url-friendly link
    # lowercase, no trailing spaces, spaces as dash, no weird chars.
    shortlink = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    return shortlink
  end

end
