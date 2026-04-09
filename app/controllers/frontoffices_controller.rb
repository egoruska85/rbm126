class FrontofficesController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_orders = Order.where(user_id: current_user.id, completed: nil)
  end

  def show
    @order = Order.find(params[:id])
    @images = @order.images
    check_order(@order)
  end

  private

  def check_order(order)
    if order.user_id != current_user.id
      redirect_to frontoffices_path
    end
  end
end
