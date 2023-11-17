class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_order, only: [:show, :edit, :update, :destroy]
  
    # GET /orders
    def index
      @orders = Order.all
      render json: @orders
    end
  
    # GET /orders/1
    def show
      render json: @order
    end
  
    # GET /orders/new
    def new
      @order = Order.new
    end
  
    # POST /orders
    def create
      @order = Order.new(order_params)
      if @order.save
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # GET /orders/1/edit
    def edit
    end
  
    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /orders/1
    def destroy
      @order.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:client_id, :service_id, :order_date, :status, :total_amount)
    end
  end
  