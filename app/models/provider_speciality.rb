# frozen_string_literal: true

class ProviderSpeciality < ApplicationRecord
  belongs_to :provider
  enum category: { flooring: 'flooring', other: 'other' }
  enum material: { wood: 'wood', carpet: 'carpet', tiles: 'tiles' }
end
