Ubuntufeed::Application.routes.draw do
  root :to => 'posts#index'
  get 'about', :to => 'posts#about', :as => 'about'
end
