class OrderInformation < ApplicationRecord
  belongs_to :order

  # presence: true 空を許可しない
  # 10桁以上11桁以内の半角数値
  validates :post_code, presence: true, format: {with: /\A\d{10,11}\z/ , message: "is invalid. 10 to 11 digit half-width numeric value"}

  # presence: true 空を許可しない
  validates :order, :post_code, :municipality, :address, :phone_number, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
end
