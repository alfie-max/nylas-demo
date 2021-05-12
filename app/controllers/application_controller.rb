class ApplicationController < ActionController::Base
  def nylas
    @nylas ||= nylas_client(ENV['ACCOUNT_ACCESS_TOKEN'])
  end

  def nylas_client(token)
    @nylas_client = Nylas::API.new(
      app_id: ENV['NYLAS_CLIENT_ID'],
      app_secret: ENV['NYLAS_CLIENT_SECRET'],
      access_token: token
    )
  end
end
