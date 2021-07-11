# frozen_string_literal: true

class CustomerFlooringRequest < ApplicationRecord
  enum material: { wood: 'wood', carpet: 'carpet', tiles: 'tiles' }

  # validates :material, inclusion: { in: materials.values }
  validates :lat, :lng, :phone_number, :square_meters, :material, presence: true

  def self.valid_material?(query)
    materials.values.include? query
  end
end
