Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'visitors#index'

  resources :visitors do
    collection do
      get :index
    end
  end

  resources :objectives do
    collection do
    end
  end
end

