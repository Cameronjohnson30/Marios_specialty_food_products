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

  def edit 
    @product = Product.find(params[:id])
    render :edit
  end

  def show 
    @product = Product.find(params[:id])
    render :show
  end

  def update 
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully DESTROYED"
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name, :country_of_origin)
    end
end 