Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watches, except: :index do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end

  get "/my_bookings", to: "bookings#my_bookings"
  get "/my_watches_bookings", to: "bookings#my_watches_bookings"
  patch "/confirm_booking/:id", to: "bookings#confirm_booking"
end
