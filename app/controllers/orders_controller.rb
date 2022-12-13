class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_user_session_path, only: [:index]

  def index
    if @item.order == nil && @item.user_id != current_user.id && user_signed_in?
      @order_form = OrderForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_user_session_path
    unless user_signed_in?
      redirect_to user_session_path
    end
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
