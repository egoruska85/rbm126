class ServicesController < ApplicationController
  def index
    @services = Service.all
    @page_title = "Наши услуги"
  end
  def show
    @service = Service.find(params[:id])
    set_page_options(@service.title)
  end

  private

  def set_page_options(page_title)
    @page_title = page_title
  end
end
