# frozen_string_literal: true

class CustomerFlooringRequest < ApplicationRecord
  enum material: { wood: 'wood', carpet: 'carpet', tiles: 'tiles' }

  # validates :material, inclusion: { in: materials.values }
  validates :lat, :lng, :phone_number, :square_meters, :material, presence: true
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :square_meters, numericality: { greater_than: 0 }

  def self.valid_material?(query)
    materials.values.include? query
  end

  def matching_providers
    Provider
      .supports_category_and_material(ProviderSpeciality.categories[:flooring], material)
      .within_operating_radius(lat, lng)
  end
end
