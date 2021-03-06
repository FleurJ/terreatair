Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /fr|nl|en/ do
    root to: 'contents#index'
    resources :contents
    resources :users
    resources :tags
    get '/admin', to: 'pages#admin'
    get '/admin/contents', to: 'contents#admin'
  end



end
