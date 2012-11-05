module Zoner

  def self.germanify
    zone_germany = Spree::Zone.find_by_name('Deutschland')
    zone_world = Spree::Zone.find_by_name('Weltweit')

    zone_germany.zone_members.destroy_all
    zone_world.zone_members.destroy_all

    Spree::Country.all.each do |country|
      if country.iso == 'DE'
        zone_germany.zone_members.create! :zoneable_type => 'Spree::Country', :zone_id => zone_germany.id, :zoneable_id => country.id
      else
        zone_world.zone_members.create! :zoneable_type => 'Spree::Country', :zone_id => zone_world.id, :zoneable_id => country.id
      end
    end
  end

end