class ClientsController < ApplicationController
   
    skip_before_action :verify_authenticity_token
    before_action :set_client, only: [:show, :edit, :update, :destroy]
  
    # GET /clients
    def index
      @clients = Client.all
      render json: @clients
    end
  
    # GET /clients/1
    def show
      render json: @client
    end
  
    # GET /clients/new
    def new
      @client = Client.new
    end
  
    # POST /clients
    def create
      @client = Client.new(client_params)
      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end
  
    # GET /clients/1/edit
    def edit
    end
  
    # PATCH/PUT /clients/1
    def update
      # Skip the before_action for the update action
      skip_before_action :set_client
      if @client.update(client_params)
        render json: @client
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /clients/1
    def destroy
      @client.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :phone, :address, :preferred_contact)
    end
  end
  