class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


    private

    def item_parameter
      params.require(:item).permit(:item_name, :image, :explanation, :category_id,
      :situation_id, :shipping_fee_id, :prefecture_id,
      :shipping_date_id, :amount).merge(user_id: current_user[:id])
    end

end
