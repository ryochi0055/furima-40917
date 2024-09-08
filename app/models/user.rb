class User < ApplicationRecord

  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :birthday, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_rub, presence: true
  validates :first_name_rub, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
