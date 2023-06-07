class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @concert = Concert.find(params[:concert_id])
    @review.attendance = current_user.attendance_info(@concert)
    if @review.save
      redirect_to concert_path(@concert)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end