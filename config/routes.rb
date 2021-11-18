Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :watches do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end

  get "/my_bookings", to: "bookings#my_bookings"
  get "/my_watches_bookings", to: "bookings#my_watches_bookings"
  get "/accept_booking/:id", to: "bookings#accept", as: :accept_booking
  get "/reject_booking/:id", to: "bookings#reject", as: :reject_booking
end
