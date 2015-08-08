class MenucardController < ApplicationController
	def show
	end

	def new_food
		@food = Food.new
	end

	def create_food
    @food = Food.new(name: params[:food][:name], cost: params[:food][:cost], type: params[:food][:type])

    respond_to do |format|
      if @food.save
        format.html { 
          flash[:success] = "Food created!"
          redirect_to menucard_path 
        }
        format.json { render :show, status: :created, location: menucard_path }
      else
        format.html { render :new_food }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
	end

  def edit_food
    @food = Food.find(params[:id])
  end

  def update_food
    @food = Food.find(params[:id])
    respond_to do |format|
      if @food.update(name: params[:food][:name], cost: params[:food][:cost], type: params[:food][:type])
        format.html { 
          flash[:success] = 'Food item was successfully updated.' 
          redirect_to menucard_path
        }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_food
    @food = Food.find(params[:id])
    @food.destroy
    respond_to do |format|
      format.html { 
        flash[:success] = 'Food item was successfully destroyed.' 
        redirect_to menucard_path
      }
      format.json { head :no_content }
    end
  end
end
