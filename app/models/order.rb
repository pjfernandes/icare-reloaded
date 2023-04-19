class Order < ApplicationRecord
  #belongs_to :client
  #belongs_to :caregiver

  attr_accessor :card_number
  attr_accessor :card_name
  attr_accessor :cart_validity
end
