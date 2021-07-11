# frozen_string_literal: true

class AddSpecialityCategoryToProviderSpecialities < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE speciality_category AS ENUM ('flooring','other');
    SQL
    add_column :provider_specialities, :category, :speciality_category
  end

  def down
    remove_column :provider_specialities, :category
    execute <<-SQL
      DROP TYPE speciality_category;
    SQL
  end
end
