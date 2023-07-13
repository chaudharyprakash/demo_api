Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :libraries, only: [] do
        get 'books', to: 'libraries#books'
      end
    end
  end
end
