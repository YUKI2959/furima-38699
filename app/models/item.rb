class Item < ApplicationRecord
  # Association
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :ship_charge
  belongs_to :area
  belongs_to :ship_day
end