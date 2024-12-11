Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root to: "dashboard#index", as: :user_root
  end
  
  unauthenticated :user do
    root "home#index"
  end
end
