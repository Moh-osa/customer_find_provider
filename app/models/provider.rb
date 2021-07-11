# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :provider_specialities, dependent: :destroy
end
