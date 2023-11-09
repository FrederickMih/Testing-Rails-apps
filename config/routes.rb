Rails.application.routes.draw do

  root "groups#index"
  
  resources :groups, only: [:index, :new, :create] do
    resources :leaders, only: [:index, :new, :show, :create]
  end
  
end
