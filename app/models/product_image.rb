class ProductImage < ActiveRecord::Base
	belongs_to :products, :autosave => true
end
