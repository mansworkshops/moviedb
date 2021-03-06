class Movie < ActiveRecord::Base
  attr_accessible :language, :length, :title, :year, :genre_id

  validates_presence_of :title, :year
  validates_uniqueness_of :title

  belongs_to :genre

  after_create :alert_admins

  def alert_admins
    # ...
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
