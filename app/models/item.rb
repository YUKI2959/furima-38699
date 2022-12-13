class Item < ApplicationRecord
  # Association
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :ship_charge
  belongs_to :area
  belongs_to :ship_day
  has_one_attached :image
  has_one    :order

  validates :item_name, :item_text, :image, :item_price, presence: true

  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_charge_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_day_id,       numericality: { other_than: 1, message: "can't be blank" }

  validates :item_price,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'Price is invalid. Input half-width characters' }
  validates :item_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'Price is out of setting range' }
end
