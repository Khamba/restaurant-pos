class Order < ActiveRecord::Base
	belongs_to(:customer)
	belongs_to :food
	belongs_to(:table)
	belongs_to(:waiter)

	validates :food_id, numericality: true
	validates :table_id, numericality: true
	validates :waiter_id, numericality: true
	validates :customer_id, numericality: true
	validates_time :time
	validates :cost, numericality: true
	validates :delivered, :inclusion => {:in => [true, false]}
end
