class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:item_id, :post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
