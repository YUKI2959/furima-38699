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
    Payjp.api_key = "秘密鍵"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price,       # 商品の値段
      card: @order_form.token,        # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
