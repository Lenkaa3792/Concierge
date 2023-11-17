class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_payment, only: [:show, :edit, :update, :destroy]
  
    # GET /payments
    def index
      @payments = Payment.all
      render json: @payments
    end
  
    # GET /payments/1
    def show
      render json: @payment
    end
  
    # GET /payments/new
    def new
      @payment = Payment.new
    end
  
    # POST /payments
    def create
      @payment = Payment.new(payment_params)
      if @payment.save
        render json: @payment, status: :created
      else
        render json: @payment.errors, status: :unprocessable_entity
      end
    end
  
    # GET /payments/1/edit
    def edit
    end
  
    # PATCH/PUT /payments/1
    def update
      if @payment.update(payment_params)
        render json: @payment
      else
        render json: @payment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /payments/1
    def destroy
      @payment.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:order_id, :amount, :payment_date, :payment_method, :status)
    end
  end
  