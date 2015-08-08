class Customer < ActiveRecord::Base
	belongs_to :table
	belongs_to(:waiter)
	has_many(:orders)
	validates :table_id, numericality: true
	validates_datetime :datetime
	validates :bill, numericality: true, allow_nil: true
	validates :waiter_id, numericality: true
	validates :finished_eating, :inclusion => {:in => [true, false]}
end
