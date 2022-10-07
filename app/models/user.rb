class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 50 }
  validates :post_counter, presence: true, numericality: { only_integer: true }

  has_many :comments, dependent: :destroy
  has_many :posts, foreign_key: 'user_id', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', dependent: :destroy

  def recent_comments
    comments.last(3)
  end
end
