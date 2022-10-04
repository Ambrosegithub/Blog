class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }
  validates :post_counter, presence: true, numericality: { only_integer: true }
  before_save :assign_role
  has_many :comments,dependent: :destroy
  has_many :posts, foreign_key: 'user_id',dependent: :destroy
  has_many :likes, foreign_key: 'user_id',dependent: :destroy
  def recent_comments
    comments.last(3)
  end

  def admin?
    self.role == 'admin'
  end

  def assign_role
    self.role = 'user' if self.role.nil?
  end
end
