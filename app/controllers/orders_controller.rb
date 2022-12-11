class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    OrderInformation.create(order_information_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def order_information_params
    params.permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(order_id: @order.id)
  end
end
