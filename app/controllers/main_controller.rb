class MainController < ApplicationController
  def index
    @services = Service.all
    @contact = Contact.new
  end
end
