class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.find(params[:order_id])
    @message = @order.messages.build(message_params)
    @message.order_id = @order.id
    @message.user_id = current_user.id
    @message.save

    if current_user.admin
      redirect_back(fallback_location: root_path)
    elsif current_user.admin != true
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id, :order_id)
  end
end
