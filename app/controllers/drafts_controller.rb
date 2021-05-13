class DraftsController < ApplicationController
  before_action :set_draft, only: %i[send_mail]

  def index
    @drafts = nylas.drafts
  end

  def send_mail
    @draft.send!

    redirect_to drafts_path
  end

  private

  def set_draft
    @draft ||= nylas.drafts.find(params[:id])
  end
end
