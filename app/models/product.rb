class Product < ActiveRecord::Base
	has_many :product_images#, dependent :destroy
	#has_many :tags#, dependent :destroy
	#has_many :categories#,dependent :destroy
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  	acts_as_taggable_on :categories#, :interests

	def all_tags=(names)
  	  self.tags = names.split(",").map do |name|
      	Tag.where(name: name.strip).first_or_create!
  		end
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end
end
