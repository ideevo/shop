source 'https://rubygems.org'

# Rails
gem 'rails', '3.2.12'
gem 'mysql2', '0.3.11'
gem 'jquery-rails', '2.1.3'
gem 'rails-i18n', '0.6.6'
gem 'slim-rails', '1.0.3'
gem 'haml-rails', '0.3.5'

# Spree
gem 'spree', github: 'spree/spree', branch: '1-1-stable', ref: '91d3e14d42ef7ef79f7ae612bf42336ae5a9e821'
gem 'spree_i18n', github: 'spree/spree_i18n', ref: '4eb339625d31ab8db51e93e83639f40bff8e7776'
gem 'spree_paypal_express', github: 'spree/spree_paypal_express', branch: '1-1-stable', ref: '267be504e4affd7866a5e31e80565126f9db7cc3'
gem 'spree_social', github: 'halo/spree_social', branch: '1-1-stable', ref: 'e8641c6a490d0bfc392e8513a70f8a83615f8931'
gem 'spree_master_price', github: 'mdlima/spree-master-price', ref: 'ade0401f506075783ab4344aa04ab18aea56193c'
gem 'spree_flexi_variants', github: 'halo/spree_flexi_variants', branch: 'spree-1-1-stable'
#gem 'spree_flexi_variants', path: '../spree_flexi_variants', branch: 'spree-1-1-stable'
gem 'spree_essential_cms', github: 'citrus/spree_essential_cms', ref: '31c229ad22908172fdd1ae38d95cc8a3e9aae8d9'
gem 'spree_slider', '1.2.0'

# Custom
gem 'carrierwave', '0.7.0'

group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.3.0'
end

group :production do
  gem 'therubyracer', '0.10.2'
end

group :development do
  gem 'capistrano', '2.15.4'
  gem 'foreman', '0.60.2'
  gem 'thin', '1.3.1'
end
