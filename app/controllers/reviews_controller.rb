class ReviewsController < ApplicationController

  def edit
    @review = Review.find(params[:id])
  end

  def new
    @review = Product.find(params[:product_id]).reviews.new
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)

    redirect_to product_path(@review.product)

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to product_path(@review.product)
  end

  def create
    @review = Review.new(review_params.merge({product_id:params[:product_id]}))
    if @review.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to product_path(@review.product)
    end
  end


  private

  def review_params
    params.require(:review).permit(:text)
  end

end
