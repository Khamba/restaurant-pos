class Food < ActiveRecord::Base
	has_many(:orders)
	self.inheritance_column = nil

	validates :name, presence: true
	validates :cost, numericality: { minimum: 1 }
	validates :type, presence: true
end
