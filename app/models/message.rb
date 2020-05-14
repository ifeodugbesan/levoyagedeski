class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  after_create :notify_pusher

  def message_time
    created_at.strftime("%H:%M")
  end

  def notify_pusher
    Pusher.trigger("le-voyage-chat_#{self.conversation.id}", 'my-event', message_info)
  end

  def message_info
    {
      body: body,
      conversation_id: conversation_id,
      user_id: user_id,
      created_at: created_at.strftime("%H:%M"),
      cloud: 'le-voyage', # PUT IN ENV
      avatar: user.avatar.key
    }
  end
end
