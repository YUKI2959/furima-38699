class Item < ApplicationRecord
  # Association
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :ship_charge
  belongs_to :area
  belongs_to :ship_day

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true
  #ジャンルの選択が「---」の時は保存できないようにする
  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank"} 
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :ship_charge_id,    numericality: { other_than: 1, message: "can't be blank"} 
  validates :area_id,           numericality: { other_than: 1, message: "can't be blank"} 
  validates :ship_day_id,       numericality: { other_than: 1, message: "can't be blank"} 

end