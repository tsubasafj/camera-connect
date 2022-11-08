class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages 
  has_one_attached :avatar

  with_options length: { maximum: 40 } do
    validates :name, presence: true
    validates :camera
    validates :camera_career
    validates :model_career
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :update, allow_blank: true
end
