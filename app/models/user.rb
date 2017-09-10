class User < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :bookmarks, through: :likes
  has_many :topics, through: :bookmarks

  before_save { self.role ||= :user }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  enum role: [:user, :admin]
end
