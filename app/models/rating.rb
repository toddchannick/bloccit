class Rating < ActiveRecord::Base
  enum severity: [ :PG, :PG13, :R ]

  has_many :topics
  has_many :posts
  belongs_to :rateable, polymorphic: true
  before_save { self.severity ||= :pg }

  def self.update_rating(rating_string)
    Rating.find_or_create_by(severity: rating_string.to_i)
  end

end
