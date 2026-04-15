class OrdersController < ApplicationController
  def index

end

def new

end

def create
  @order = Order.new(order_params)
  if user_signed_in?
    @order.name = current_user.username
    @order.phone = current_user.phone
    @order.user_id = current_user.id
    @order.accepted = false
    @order.completed = false
  end
  if @order.save
    redirect_to root_path, notice: "Заявка принята, с вами свяжутся ближайшее время"
  else
    redirect_to root_path, alert: "Оформите заявку правильно"
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
  @order.update(active: !@order.active)

  redirect_back fallback_location: backoffice_path(@order)
end

private

  def order_params
    params.require(:order).permit(:service_id, :name, :desc, :phone, images: [])
  end
end
