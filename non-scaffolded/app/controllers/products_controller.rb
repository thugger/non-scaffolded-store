class ProductsController < ApplicationController
  before_action :load_product_by_id, only: [:show, :update, :edit, :destroy]

  def index # index action
  		@products = Product.all
  end

  def show
  	
  end

  def new
  	#render text: "Looks ok!" #render overrides the action that looks for a view
  	@product = Product.new
  end

  def create
  	@product = Product.new(whitelisted_params)
  	
  	if (@product.save)
  		redirect_to @product #redirect to the show action this really goes to product_path(@product.id)
  	else
  		#render text: @product.errors.inspect
      render :new
  	end

  end

  def edit
    
  end

  def update
      
      if (@product.update_attributes(whitelisted_params))
        redirect_to @product
      else
        render :edit
      end
  end

  def destroy
    
    @product.destroy
    redirect_to root_path
  end

  private
  def whitelisted_params
  	params.require(:product).permit(:name, :description, :price, :image_filename)
  	
  end

  def load_product_by_id
    @product = Product.find(params[:id])
  end
end
