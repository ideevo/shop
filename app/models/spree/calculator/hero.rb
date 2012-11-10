# -*- encoding : utf-8 -*-
module Spree
  class Calculator::Hero < Calculator

    preference :first_item,             :decimal, :default => 4.3
    preference :additional_item,        :decimal, :default => 4.3
    preference :free_after_items_count, :integer, :default => 9

    attr_accessible :preferred_first_item, :preferred_additional_item, :preferred_free_after_items_count

    def self.description
      'Kleiderbügel Frachtrechner'
    end

    def self.available?(object)
      true
    end

    def compute(object)
      items_count = object.line_items.map(&:quantity).sum
      if items_count > self.preferred_free_after_items_count.to_i
        return 0.0
      else
        sum = 0
        items_count.times do |i|
          if i == 0
            sum += self.preferred_first_item.to_f
          else
            sum += self.preferred_additional_item.to_f
          end
        end
        sum
      end
    end

  end
end