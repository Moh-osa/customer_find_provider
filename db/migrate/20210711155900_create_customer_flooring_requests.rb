# frozen_string_literal: true

class CreateCustomerFlooringRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_flooring_requests do |t|
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :phone_number, limit: 50
      t.column :material, :speciality_material
      t.integer :square_meters
      t.timestamps
    end
  end
end
