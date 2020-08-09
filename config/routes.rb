Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"

      resources :users, only: [:index, :shows] do
        member do
          get :quizes, to: 'quizes#index'
          post :quizes, to: 'quizes#create'
        end
      end

      resources :quizes, only: :show do
        member do
          post :questions, to: 'questions#create'
        end
      end

      resources :questions, only: :show do
        member do
          post :choices, to: 'choices#create'
        end
      end
    end
  end
end
