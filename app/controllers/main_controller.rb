class MainController < ApplicationController
  before_action :set_page_options

  def index
    @services = Service.order(:numeric)
    @contact = Contact.new
    @reviews = Review.all.page(params[:page]).per(3)
    @review = Review.new
  end

  private

  def set_page_options
    @page_title = "РемБытМастер126"
    #@page_description = "Parfum"
    #@page_keywords = "Man Woman Kids"
  end
end
