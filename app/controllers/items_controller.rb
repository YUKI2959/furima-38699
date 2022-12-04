class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:item).permit(:item_name,:item_text,:item_category_id,:item_condition_id,:ship_charge_id,:area_id,:ship_day_id,:item_price).merge(user_id: current_user.id)
  end
end
