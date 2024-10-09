class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    if current_user.id == set_item.user_id || set_item.purchase_record.present?
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @purchase_form = PurchaseRecordShippingAddress.new
    end
  end

  def create
    @purchase_form = PurchaseRecordShippingAddress.new(purchase_record_shipping_address_params)
    Rails.logger.debug purchase_record_shipping_address_params.inspect
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_shipping_address_params
    params.require(:purchase_record_shipping_address).permit(:post_code, :prefecture_id, :municipality, :street_address,
   :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.amount,
      card: purchase_record_shipping_address_params[:token],
      currency: 'jpy'
    )
  end

end
