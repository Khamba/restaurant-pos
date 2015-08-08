class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  def select
    @customers = Customer.where(finished_eating: false)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
  end

  def generate_bill
    table = Table.find(params[:table_id])
    @customer = table.customers.order(:datetime).last
    bill = 0
    @customer.orders.each do |order|
      bill += order.cost
    end
    @customer.update(bill: bill)
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  #def edit
  #end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.datetime = DateTime.now
    @customer.finished_eating = false

    respond_to do |format|
      if @customer.save
        @customer.table.update(occupied: true)
        format.html { 
          flash[:success] = "Customer created!"
          redirect_to new_order_path 
        }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  # def update
  #   respond_to do |format|
  #     if @customer.update(customer_params)
  #       format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @customer }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @customer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def leave_select
    @customers = Customer.where(finished_eating: false).order("datetime DESC")
  end

  def leave
    @customer = Customer.find(params[:id])
    @customer.update(finished_eating: true)
    @customer.table.update(occupied: false)
    if @customer.orders.count == 0
      @customer.destroy
    end
    flash[:notice] = "Customer left"
    redirect_to menucard_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:table_id, :waiter_id)
    end
end
