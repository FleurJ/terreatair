Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /fr|nl/ do
    root to: 'pages#home'
    #resources :restaurants

    # [...]
  end
end
