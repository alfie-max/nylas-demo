class MessagesController < ApplicationController
  before_action :set_message,
                only: %i[show destroy mark_as_read mark_as_unread reply]

  def index
    @messages = nylas.messages
  end

  def show; end

  def mark_as_read
    @message.update(unread: false)

    redirect_to root_path
  end

  def mark_as_unread
    @message.update(unread: true)

    redirect_to root_path
  end

  def reply
    message = @message.to_h
    @draft = nylas.drafts.create(
      from: message[:to],
      to: message[:from],
      reply_to_message_id: message[:id],
      subject: params[:subject],
      body: params[:body]
    )
    @draft.send!

    flash[:success] = 'Reply Sent'
    redirect_to message_path(@message.id)
  end

  private

  def set_message
    @message ||= nylas.messages.find(params[:id])
  end
end
