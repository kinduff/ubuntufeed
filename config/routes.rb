Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'

  get 'feed', :to => 'posts#feed', :as => 'feed'

  get 'about', :to => 'blogs#index', :as => 'about'
  get 'enviar', :to => 'blogs#new', :as => 'enviar'

  resources :posts
  resources :blogs
end
