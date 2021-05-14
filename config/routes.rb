Rails.application.routes.draw do
  root 'messages#index'

  resources :messages do
    member do
      get :mark_as_read
      get :mark_as_unread
      post :reply
    end
  end

  resources :drafts do
    member do
      get :send_mail
    end
  end

  resources :files, only: :show
  resources :folders, only: :show

  get '/auth/microsoft_office365/callback', to: 'office365#callback', as: :office365_callback
end
