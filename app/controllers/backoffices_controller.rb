class BackofficesController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all.order(updated_at: :desc).where(completed: nil)
    if current_user.admin == nil
      redirect_to root_path
    end
  end
  def show
    @order = Order.find(params[:id])
    @images = @order.images
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back fallback_location: backoffice_path(@order)
  end

  def toggle_active
    @order = Order.find(params[:id])
    @order.update(accepted: !@order.accepted)

    redirect_back fallback_location: backoffice_path(@order)
  end
  def toggle_completed
    @order = Order.find(params[:id])
    @order.update(completed: !@order.completed)

    redirect_back fallback_location: backoffice_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:service_id, :name, :desc, :phone, :answer, images: [])
  end
end
