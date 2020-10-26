Rails.application.routes.draw do
  resources :to_dos do
    collection do
      post 'create_samples'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
