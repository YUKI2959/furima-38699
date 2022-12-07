class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :item_category_id, :item_condition_id, :ship_charge_id, :area_id,
                                 :ship_day_id, :item_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
