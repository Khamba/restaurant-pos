class Waiter < ActiveRecord::Base
	has_many :orders

	validates :name, presence: true
	validates :salary, numericality: { minimum: 1 } 
end
