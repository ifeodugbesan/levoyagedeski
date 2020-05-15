class MessagesController < ApplicationController
  before_action :set_coversation

  def index
    @messages = policy_scope(Message).where(conversation: @conversation).order(created_at: :asc)
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = policy_scope(Message).where(conversation: @conversation).order(created_at: :asc)
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
    render partial: 'messages/message' if @message.save
    authorize @message
  end

  private

  def set_coversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
