class ServicesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_service, only: [:show, :edit, :update, :destroy]

    # GET /services
    def index
      @services = Service.all
      render json: @services
    end
  
    # GET /services/1
    def show
      render json: @service
    end
  
    # GET /services/new
    def new
      @service = Service.new
    end
  
    # POST /services
    def create
      @service = Service.new(service_params)
      if @service.save
        render json: @service, status: :created
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    end
  
    # GET /services/1/edit
    def edit
    end
  
    # PATCH/PUT /services/1
    def update
      if @service.update(service_params)
        render json: @service
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /services/1
    def destroy
      @service.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :price, :duration)
    end
  end
  