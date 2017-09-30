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

  # def show
  #   @message = Message.find(params[:id])
  #   render json: @message
  # end

  def create
    @channel = Channel.find_by(name: params[:channel_id] )
    @message = Message.new(message_params)
    @message.user = current_user
    @message.channel = @channel
    @message.save
    message_json = {
      id: @message.id,
      content: @message.content,
      author: @message.user.email,
      channel: @channel.name
    }
    render json: message_json
  end

  def set_channel
    # @channel =
  end
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
