class PurchaseController < ApplicationController
  require 'payjp'
  before_action :move_to_login, :set_item, :move_to_toppage

  def index
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(
      :postal_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :telephone,
      :item_id
      ).merge(user_id: current_user.id)
  end

  def card_params
    params.permit(
      :token,
      :number,
      :cvc,
      :exp_month,
      :exp_year
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.prices,
      card: card_params[:token],
      currency: 'jpy' 
    )
  end

  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_toppage
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end
end
