# frozen_string_literal: true

class CreateProviderSpecialities < ActiveRecord::Migration[6.1]
  def change
    create_table :provider_specialities do |t|
      t.references :providers, index: true, foreign_key: true
      t.timestamps
    end
  end
end
