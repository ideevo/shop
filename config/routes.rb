Spree::Core::Engine.routes.draw do

  resources :products do
    member do
      resources :images, only: :show do
        get ':size', to: 'products#image', as: :custom_product
      end
    end
  end

end

Ideevo::Application.routes.draw do

  mount Spree::Core::Engine, :at => '/'

end
