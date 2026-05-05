class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if user_signed_in?
      @review.email = current_user.email
      @review.author = current_user.username
    end
    if @review.save
      redirect_to root_path, notice: 'Спасибо за ваш отзыв!'
    else
      @reviews = Review.all
      redirect_to root_path, notice: 'Не правильно составлен отзыв!'
    end
  end

  private

  def review_params
    params.require(:review).permit(:author, :message, :email, :rating)
  end
end
