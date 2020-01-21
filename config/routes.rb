Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "index#index"

  namespace :admin do
    resources :packages do
      collection do
        get :report
      end
    end
  end
end
