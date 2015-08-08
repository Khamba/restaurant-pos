class ReportsController < ApplicationController

	def reports
	end

	def all
		@orders = Order.all.order("time DESC")
		if !params[:days].blank?
			@orders = @orders.where("time > ?", params[:days].to_i.days.ago)
		end
	end

	def food
		@orders = Order.all.order("time DESC")
		if !params[:food_id].blank?
			@orders = @orders.where(food_id: params[:food_id])
		end
		if !params[:days].blank?
			@orders = @orders.where("time > ?", params[:days].to_i.days.ago)
		end
	end

	def waiter
		@orders = Order.all.order("time DESC")
		if !params[:waiter_id].blank?
			@orders = @orders.where(waiter_id: params[:waiter_id])
		end
		if !params[:days].blank?
			@orders = @orders.where("time > ?", params[:days].to_i.days.ago)
		end
	end

	def table
		@orders = Order.all.order("time DESC")
		if !params[:table_id].blank?
			@orders = @orders.where(table_id: params[:table_id])
		end
		if !params[:days].blank?
			@orders = @orders.where("time > ?", params[:days].to_i.days.ago)
		end
	end

end
