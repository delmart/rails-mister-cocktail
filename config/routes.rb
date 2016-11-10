Rails.application.routes.draw do
  root :to => "cocktails#index"
  resources :cocktails do
    resources :doses, except: [:destroy]
  end
  resources :doses, only: [:destroy]
end
