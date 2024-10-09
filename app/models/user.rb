class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :last_name_rub, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width characters' }
  validates :first_name_rub, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: ' is invalid. Input full-width characters' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
   validates :last_name
   validates :first_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: ' is invalid. Include both letters and numbers'

  has_many :items
  has_many :purchase_records
end