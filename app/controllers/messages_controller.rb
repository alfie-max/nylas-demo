class MessagesController < ApplicationController
  before_action :set_message, only: %i[show destroy mark_as_read mark_as_unread ]

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

  private

  def set_message
    @message ||= nylas.messages.find(params[:id])
  end
end
