class Office365Controller < ApplicationController
  def callback
    auth_hash = request.env['omniauth.auth']

    nylas_token = nylas.authenticate(
      name: auth_hash['info']['display_name'],
      email_address: auth_hash['info']['email'],
      provider: :office365,
      settings: {
        microsoft_client_id: ENV['OFFICE_365_ID'],
        microsoft_client_secret: ENV['OFFICE_365_SECRET'],
        microsoft_refresh_token: auth_hash['credentials']['refresh_token'],
        redirect_uri: office365_callback_url
      },
      scopes: 'email.modify,email.send,email.folders_and_labels,email.drafts,calendar,contacts'
    )

    render json: nylas_token
  end
end
