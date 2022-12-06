class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :item_category_id, :item_condition_id, :ship_charge_id, :area_id,
                                 :ship_day_id, :item_price).merge(user_id: current_user.id)
  end
end
