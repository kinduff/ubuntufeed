Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'

  get 'feed', :to => 'posts#feed', :as => 'feed'

  get 'about', :to => 'blogs#index', :as => 'about'
  get 'enviar', :to => 'blogs#new', :as => 'enviar'

  get 'mostrar/:id', :to => 'admin#mostrar', :as => 'mostrar'
  get 'ocultar/:id', :to => 'admin#ocultar', :as => 'ocultar'
  get 'actualizar/:arg', :to => 'admin#actualizar', :as => 'actualizar'
  get 'eliminar/:id', :to => 'admin#eliminar', :as => 'eliminar'

  resources :posts
  resources :blogs
  resources :admin
end
