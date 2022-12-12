class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_form = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: @order_form.token,
      currency: 'jpy'
    )
  end
end
