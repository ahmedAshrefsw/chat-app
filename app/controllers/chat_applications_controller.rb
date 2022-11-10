require 'securerandom'
class ChatApplicationsController < ApplicationController
  before_action :set_chat_application, only: [:show, :update, :destroy]

  # GET /applications
  def index
    @chat_applications = ChatApplication.all

    render json: @chat_applications
  end

  # GET /applications/id / should deal with the token 
  def show
    render json: @chat_application
  end

  # POST /applications
  def create 
    @chat_application = ChatApplication.new(chat_application_params)
    @chat_application.token = SecureRandom.hex

    if @chat_application.save
      render json: @chat_application, status: :created
    else
      render json: @chat_application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @chat_application.update(chat_application_params)
      render json: @chat_application
    else
      render json: @chat_application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    @chat_application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_application
      @chat_application = ChatApplication.find_by(token: params[:token])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_application_params
      params.require(:chat_application).permit(:name)
    end
end
