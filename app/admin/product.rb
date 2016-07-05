ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :name,:expire_date,:price,:tag_list

	index do
		column :name
		column :id
		column :price
		column :expire_date
		column "Image" do |product|
		  image_tag product.product_images.first.img_path, class: 'my_image_size'
		end
		column :tag_list
		actions
	end

	form do |f|
		inputs 'Update the Product Details' do
			input :name
			input :price
			input :expire_date
			input :tag_list
			actions
		end
	end

end