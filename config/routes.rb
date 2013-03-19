Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'

  get 'feed', :to => 'posts#feed', :as => 'feed'

  get 'about', :to => 'blogs#index', :as => 'about'
  get 'enviar', :to => 'blogs#new', :as => 'enviar'

  get 'populares', :to => 'posts#populares', :as => 'populares'
  get 'post/:id/:slug', :to => 'posts#post', :as => 'post'

  get 'mostrar/:id', :to => 'admin#mostrar', :as => 'mostrar'
  get 'ocultar/:id', :to => 'admin#ocultar', :as => 'ocultar'
  get 'actualizar/:arg', :to => 'admin#actualizar', :as => 'actualizar'
  get 'eliminar/:id', :to => 'admin#eliminar', :as => 'eliminar'
  get 'admin', :to => 'admin#index', :as => 'admin'
  get 'admin/new', :to => 'admin#new', :as => 'admin_new'
  post 'admin/new', :to => 'admin#create', :as => 'admin_create'
  get 'admin/edit/:id', :to => 'admin#edit', :as => 'admin_edit'
  put 'admin/edit/:id', :to => 'admin#update', :as => 'admin_update'
  get 'admin/stats', :to => 'admin#stats', :as => 'admin_stats'

  resources :posts
  resources :blogs

  post '/encuesta', :to => 'posts#create_encuesta', :as => 'create_encuesta'

  match '*path' => redirect('/') unless Rails.env.development?
end
