class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit
  def index
    @items = Item.all.order("created_at DESC")
    @item_count = Item.count
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_parameter)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end



    private

    def item_parameter
      params.require(:item).permit(:item_name, :image, :explanation, :category_id,
      :situation_id, :shipping_fee_id, :prefecture_id,
      :shipping_date_id, :amount).merge(user_id: current_user[:id])
    end

    def set_item
      @item = Item.find(params[:id])
    end
  
    def move_to_index
      return if current_user.id == @item.user.id
  
      redirect_to action: :index
    end

end
