class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id, :item_id, :post_code, :municipality, :address
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    # validates :post_code, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderInformation.create(post_code: post_code,area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end