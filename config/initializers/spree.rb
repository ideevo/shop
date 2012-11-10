Spree::AppConfiguration.class_eval do
  preference :default_locale, :string, default: :de
  preference :logo, :string, default: '/logos/ideevo/black170x40.png'
  preference :admin_interface_logo, :string, default: '/assets/logos/ideevo/white200x46.png'
  preference :auto_capture, :boolean, default: true
  preference :mails_from, :string, default: 'noreply@ideevo.com'
  preference :max_level_in_taxons_menu, :integer, default: 3
  preference :allow_guest_checkout, :boolean, default: false
  preference :address_requires_state, :boolean, default: false
  preference :default_country_id, :integer, default: 74
end