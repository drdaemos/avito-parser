module Avito::Models
	class Item < ActiveRecord::Base
		# refs
	  	belongs_to :district
	  	has_and_belongs_to_many :categories
	  	has_and_belongs_to_many :locations
	end
end