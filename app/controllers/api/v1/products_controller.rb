class Api::V1::ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :json

	def show
		@product=Product.includes(:product_images).find(params[:id])
		@images=ProductImage.where(:product_id=>params[:id])
		respond_to do |format|
			format.json {render :json =>{ :product=>{:parameters=>@product,:tags=>@product.tag_list,:images=>@images}},:except=>[:created_at,:updated_at,:product_id,:images=>@images.ids]}
		end
	end

	def index
		respond_with Product.all
	end

	def create
    product = Product.new(product_params)
    puts(product_params[:product])
    product.product_images.build(:img_path=>params[:product_images][:img_path])
	    if product.save
	      render json: product, status: 201, location: [:api, product]
	    else
	      render json: { errors: product.errors }, status: 422
	    end
  	end
  	def update
    product = Product.find(params[:id])
    product.product_images.build(:img_path=>params[:product_images][:img_path])
	    if product.update(product_params)
	      render json: product, status: 200, location: [:api, product]
	    else
	      render json: { errors: product.errors }, status: 422
	    end
  	end
  	def destroy
	    product = Product.find(params[:id])
	    product.destroy
	    head 204
  	end

  private

    def product_params
      params.require(:product).permit(:name, :price, :expire_date, :tag_list,:id, product_images_attributes:[:img_path,:product_id])
    end
  
end
