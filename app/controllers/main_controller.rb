class MainController < ApplicationController
  before_action :set_page_options

  def index
    @services = Service.order(:numeric).where(public: true)
    @contact = Contact.new
    @reviews = Review.where(moderation: true).page(params[:page]).per(3)
    @review = Review.new
  end

  private

  def set_page_options
    @page_title = "РемБытМастер126"
    #@page_description = "Parfum"
    #@page_keywords = "Man Woman Kids"
  end
end
