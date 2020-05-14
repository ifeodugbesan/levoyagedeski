class ConversationsController < ApplicationController
  def index
    @conversations = policy_scope(Conversation)
    filter_coversations
    @conversation = @conversations.first
    if @conversation
      @messages = @conversation.messages
      @last_message = @conversation.messages.last
      @message = @conversation.messages.new
    end
    @users = User.all
    if params[:query].present?
      @query = params[:query]
      @users = User.search_by_name(@query)
    end
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create(conversation_params)
    end
    # redirect_to conversation_messages_path(@conversation)
    @messages = @conversation.messages
    @message = @conversation.messages.new
    respond_to do |format|
      format.js { render partial: 'messages/index_web', locals: { conversation: @conversation, messages: @messages, message: @message } }
      format.html { redirect_to conversation_messages_path(@conversation) }
    end

    authorize @conversation
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def filter_coversations
    @conversations.each { |convo| convo.destroy unless convo.messages.any? }
    @conversations = (Conversation.where(sender: current_user).or(Conversation.where(recipient: current_user))).sort_by { |c| c.messages.last.created_at }.reverse
  end
end
