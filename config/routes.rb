Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products do
    resources :reviews
  end

  #we can access pruducts/product_id/review 


end
