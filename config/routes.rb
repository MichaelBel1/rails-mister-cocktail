Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
  root to: 'cocktails#index'
  delete '/doses/:id', to: 'doses#destroy'
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end
end
