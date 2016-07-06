class Product < ActiveRecord::Base
	has_many :product_images#, dependent :destroy
	#has_many :tags#, dependent :destroy
	has_many :categories, :through =>:cats
	has_many :cats
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  	acts_as_taggable_on :categories#, :interests
  	accepts_nested_attributes_for :product_images, :reject_if => :all_blank, :allow_destroy => true
  	accepts_nested_attributes_for :categories, :reject_if => :all_blank, :allow_destroy => true
	
end
