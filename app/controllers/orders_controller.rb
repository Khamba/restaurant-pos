class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    orders_not_delivered = Order.where(delivered: false).order("time")
    orders_delivered = Order.where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_table
    orders_not_delivered = Order.order(:table_id).where(delivered: false).order("time")
    orders_delivered = Order.order(:table_id).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_table_id
    orders_not_delivered = Order.where(table_id: params[:table_id]).where(delivered: false).order("time")
    orders_delivered = Order.where(table_id: params[:table_id]).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_waiter
    orders_not_delivered = Order.order(:waiter_id).where(delivered: false).order("time")
    orders_delivered = Order.order(:waiter_id).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_waiter_id
    orders_not_delivered = Order.where(waiter_id: params[:waiter_id]).where(delivered: false).order("time")
    orders_delivered = Order.where(waiter_id: params[:waiter_id]).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_food
    orders_not_delivered = Order.order(:food_id).where(delivered: false).order("time")
    orders_delivered = Order.order(:food_id).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def index_by_food_id
    orders_not_delivered = Order.where(food_id: params[:food_id]).where(delivered: false).order("time")
    orders_delivered = Order.where(food_id: params[:food_id]).where(delivered: true).order("time")
    @orders = orders_not_delivered + orders_delivered
  end

  def deliver
    @order = Order.find(params[:id])
    @order.update(delivered: true)
    redirect_to order_deliver_select_path, notice: "Order delivered"
  end

  def deliver_select
    @orders = Order.where(delivered: false).order("time")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    unless params[:order][:table_id].blank?
      table = Table.find(params[:order][:table_id])
      @order.customer_id = table.customers.order("datetime").last.id
      @order.waiter_id = table.customers.order("datetime").last.waiter_id
    end
    @order.delivered = false
    @order.time = Time.now
    unless params[:order][:food_id].blank?
      @order.cost = Food.find(params[:order][:food_id]).cost
    end

    respond_to do |format|
      if @order.save
        format.html { 
          flash[:success] = "Order created!"
          redirect_to new_order_url
        }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { 
          flash[:success] = 'Order was successfully updated.' 
          redirect_to @order
        }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:food_id, :table_id)
    end
end
