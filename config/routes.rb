Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'
  get 'about', :to => 'posts#about', :as => 'about'
  get 'enviar', :to => 'posts#enviar', :as => 'enviar'
end
