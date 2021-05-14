Rails.application.config.middleware.use OmniAuth::Builder do
  provider :microsoft_office365,
           ENV['OFFICE_365_ID'],
           ENV['OFFICE_365_SECRET'],
           scope: 'User.Read offline_access openid profile EAS.AccessAsUser.All EWS.AccessAsUser.All'
end
