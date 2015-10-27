class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

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

  #  This method takes a post object and uses where to retrieve the user's favorites
  #  with a post_id that matches post.id. If the user has favorited post it will return
  #  an array of one item. If they haven't favorited post it will return an empty array.
  #  Calling first on the array will return either the favorite or nil depnding on
  #  whether they favorited the post.
   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end

   def self.avatar_url(user, size)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end

end
