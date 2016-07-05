class Api::V1::ProductsController < ApplicationController
	respond_to :json

	def show
		respond_with Product.find(params[:id])
	end

	def index
		respond_with Product.all
	end

	def create
    product = products.build(product_params)
	    if product.save
	      render json: product, status: 201, location: [:api, product]
	    else
	      render json: { errors: product.errors }, status: 422
	    end
  	end
  	def update
    product = products.find(params[:id])
	    if product.update(product_params)
	      render json: product, status: 200, location: [:api, product]
	    else
	      render json: { errors: product.errors }, status: 422
	    end
  	end

  private

    def product_params
      params.require(:product).permit(:name, :price, :expire_date,:tag_list)
    end
  
end
