class FilesController < ApplicationController
  before_action :set_file, only: %i[show destroy mark_as_read mark_as_unread ]

  layout false

  def show
    @file.download
    send_file @file.file, filename: @file.filename, type: @file.content_type
  end

  private

  def set_file
    @file ||= nylas.files.find(params[:id])
  end
end
