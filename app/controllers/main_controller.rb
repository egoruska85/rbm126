class MainController < ApplicationController
  def index
    @services = Service.all
  end
end
