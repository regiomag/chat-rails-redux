class Api::V1::MessagesController < ApplicationController
before_action :set_channel, only: [:show]

  def index
    @channel = Channel.find_by(name: params[:channel_id] )
    messages = @channel.messages.order(created_at: :desc)
    messages_json = messages.map do |message|
      {
        id: message.id,
        content: message.content,
        author: message.user.email,
        channel: @channel.name
      }
    end
    render json: messages_json
  end
  # def index
  #   @channel = Channel.find_by(name: params[:channel_id] )
  #   @messages = @channel.messages
  #   render json: @messages
  # end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def create
    @message = message.create(message_params)
    render json: @message
  end

  def set_channel
    # @channel =
  end
  private

  def post_params
    params.require(:message).permit(:content)
  end
end
