Rails.application.routes.draw do
  root to: 'questions#index'

  resources :users, only: %i[new create edit update destroy]
  resource :session, only: %i[new create destroy]
  resources :questions do
    patch :hide, on: :member
  end
end
