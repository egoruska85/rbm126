class FrontofficesController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = Order.all.order(updated_at: :desc).where(completed: false, completed: nil)
  end

  def show
    @order = Order.find(params[:id])
    @images = @order.images
    @messages = Message.where(order_id: @order.id)
    check_order(@order)
    set_page_options(@order.id)
  end

  private

  def set_page_options(page_title)
    @page_title = "Заявка" + " " "000" + page_title.to_s
    #@page_description = "Parfum"
    #@page_keywords = "Man Woman Kids"
  end

  protected

  def check_order(order)
    if order.user_id != current_user.id
      redirect_to frontoffices_path
    end
  end
end
