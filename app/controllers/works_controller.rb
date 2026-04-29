class WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :delete, :destroy, :edit]

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
    else
      redirect_to @work, notice: "Работа не обновлена, проверьте корректность полей"
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    # 1. Берем ID картинок, которые остались в форме (те, что пользователь не удалил крестиком)
    kept_image_ids = params[:work][:existing_image_ids] || []

    # 2. Удаляем из базы те, которые пользователь убрал из превью
    @work.images.each do |img|
      img.purge unless kept_image_ids.include?(img.id.to_s)
    end

    # 3. Обновляем текст и ДОБАВЛЯЕМ новые фото (не заменяя старые)
    if @work.update(work_params.except(:images, :existing_image_ids))
      if params[:work][:images].present?
        @work.images.attach(params[:work][:images])
      end
      redirect_to @work, notice: 'Обновлено!'
    else
      render :edit
    end
  end


  private

  def work_params
    params.require(:work).permit(:title, :body, :existing_image_ids, images: [])
  end
end
