class FoldersController < ApplicationController
  before_action :set_folder

  def show
    @messages = nylas.messages.where(in: params[:id])
  end

  private

  def set_folder
    @folder ||= nylas.folders.find(params[:id])
  end
end
