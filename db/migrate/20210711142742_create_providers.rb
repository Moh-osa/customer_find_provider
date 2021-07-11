# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name, limit: 100
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.integer :operating_radius
      t.float :average_rating
      t.timestamps
    end
  end
end
