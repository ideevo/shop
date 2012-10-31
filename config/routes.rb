Ideevo::Application.routes.draw do

  get '/products/:id/image/:image/:size', :to => 'spree/products#image', :as => :product_image

  mount Spree::Core::Engine, :at => '/'

end
