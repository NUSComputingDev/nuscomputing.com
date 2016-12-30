class Product < ActiveRecord::Base
	serialize :images, Array
end
