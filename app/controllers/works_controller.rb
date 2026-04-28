class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :delete, :destroy]

  def index
    @works = Work.last(10)
  end

  def show
    @work = Work.find(params[:id])
    @comments = @work.comments.order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to @work, notice: "Работа опубликована"
    end

  end

  private

  def work_params
    params.require(:work).permit(:title, :body, images: [] )
  end
end
