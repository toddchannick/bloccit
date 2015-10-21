class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
            #Start string, one or more (indicated by the + sign) words or hyphens/periods (todd.channick), an @ symbol,
            # another word (1 or more, ex: gmail) a '.', and finally another word (.com, .org). All lowercase

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password

   enum role: [:member, :admin]
end
