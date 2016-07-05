class ProductsController < ApplicationController

	def index
		@products=Product.all
	end

	def create
	  @product = Product.new(product_params)
	  respond_to do |format|
	    if @product.save
	      format.js # Will search for create.js.erb
	    else
	      format.html { render products_path }
	    end
	  end
	end


		private
	def product_params
	  params.require(:product).permit(:name, :expire_date, :price, :tag_list)
	end
end
