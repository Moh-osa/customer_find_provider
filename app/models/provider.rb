# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :provider_specialities, dependent: :destroy

  scope :supports_category_and_material, lambda { |category, material|
    joins(:provider_specialities).where(provider_specialities: { category: category, material: material })
  }
end
