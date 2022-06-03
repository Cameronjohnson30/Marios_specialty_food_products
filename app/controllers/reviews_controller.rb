class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added"
      redirect_to projects_path(@product)
    else
      render :new
    end
  end

  def show 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  