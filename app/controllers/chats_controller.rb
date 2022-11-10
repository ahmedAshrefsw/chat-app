class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]

  # get applications/:token/chats
  def index
    @application = ChatApplication.find_by(token: params[:token])
    @chats = Chat.where(chat_application_id: @application.id)

    render json: @chats
  end

  # get applications/:token/chats/:number
  def show
    render json: @chat
  end

  # Post applications/:token/chats
  def create
    @chat = Chat.new
    @chat.number = 2
    @application = ChatApplication.find_by(token: params[:token])
    @chat.chat_application_id = @application.id

    ## todo :: make number auto configured from the server 
    ## todo :: update the chats_count and use it's new number as a chat number

    if @chat.save
      render json: @chat, status: :created
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_params
      params.require(:chat).permit(:number)
    end
end
