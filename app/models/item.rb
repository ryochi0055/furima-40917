class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :explanation,      presence: true
  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :amount,           presence: true, numericality: { only_integer: true },
                               numericality: { greater_than: 299, less_than: 10_000_000 }
end
