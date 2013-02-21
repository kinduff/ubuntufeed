Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'

  get 'feed', :to => 'posts#feed', :as => 'feed'

  get 'about', :to => 'blogs#index', :as => 'about'
  get 'enviar', :to => 'blogs#new', :as => 'enviar'

  get 'mostrar/:id', :to => 'admin#mostrar', :as => 'mostrar'
  get 'ocultar/:id', :to => 'admin#ocultar', :as => 'ocultar'
  get 'update/:arg', :to => 'admin#update', :as => 'update'

  resources :posts
  resources :blogs
  resources :admin
end
