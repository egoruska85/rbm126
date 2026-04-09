class MainController < ApplicationController
  def index
    @services = Service.order(:numeric)
    @contact = Contact.new
  end
end
