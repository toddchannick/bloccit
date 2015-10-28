class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :votes

  scope :publicly_viewable -> { where(public: true) }
  scope :privately_viewable -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
end
