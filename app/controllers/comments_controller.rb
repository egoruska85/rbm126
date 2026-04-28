class CommentsController < ApplicationController

  def create
    @work = Work.find(params[:work_id])
    @comment = @work.comments.new(comment_params)

    # Если пользователь авторизован, берем данные из его профиля


    if @comment.save
      redirect_to work_path(@work), notice: 'Отзыв успешно опубликован!'
    else
      # Если данные не валидны, возвращаемся назад с предупреждением
      redirect_to work_path(@work), alert: 'Ошибка: текст комментария не может быть пустым.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :message, :user_email, :work)
  end
end
