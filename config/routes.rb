Rails.application.routes.draw do
  root 'messages#index'

  resources :messages do
    member do
      get :mark_as_read
      get :mark_as_unread
    end
  end

  resources :files, only: :show
end
