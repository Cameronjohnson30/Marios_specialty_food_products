class ProductsController < ApplicationController

  def index
    @products = Product.all 
    render :index
  end

  def new 
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product succesfully added"
      redirect_to products_path
    else 
      render :newend
    end
  end
