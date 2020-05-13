class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
    filter_coversations
    @users = User.all
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
    authorize @conversation
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  private

  def filter_coversations
    @conversations = Conversation.where(sender: current_user).or(Conversation.where(recipient: current_user))
    @conversations.each { |convo| convo.destroy unless convo.messages.any? }
  end
end
