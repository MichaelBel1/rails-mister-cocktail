Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails do
    member do                             # member => restaurant id in URL
      get 'doses', to: "cocktails#doses"  # cocktailsController#chef
    end
  end
  resources :cocktails do
    resources :doses, only: [ :new, :create, :delete ]
  end
end
