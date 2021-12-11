Rails.application.routes.draw do
  resources :urls, only: [:index, :create, :destroy, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'urls/:url_slug' => 'urls#redirect'
  get 'urls/show/:id' => 'urls#show'
end
