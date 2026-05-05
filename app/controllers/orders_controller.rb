class OrdersController < ApplicationController
  def index

end

def new

end

def create
  @order = Order.new(order_params)
  @contact = Contact.new(params[:contact])
  if user_signed_in?
    @order.name = current_user.username
    @order.phone = current_user.phone
    @order.user_id = current_user.id
    @contact.email = current_user.email
    @contact.name = current_user.username
    @contact.phone = current_user.phone
  else
    @contact.email = 'new_order@mail.ru'
    @contact.name = @order.name
    @contact.phone = @order.phone
  end
  @order.accepted = false
  @order.completed = false
  @contact.sender = 'egoruska85@mail.ru'



  if @order.save
    redirect_to root_path, notice: "Заявка принята, с вами свяжутся ближайшее время"
  else
    redirect_to root_path, alert: "Оформите заявку правильно"
  end

  @contact.message = @order.desc + " " + "http://rembytmaster126.ru/backoffices/" + @order.id.to_s
  @contact.request = request
  @contact.deliver
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
