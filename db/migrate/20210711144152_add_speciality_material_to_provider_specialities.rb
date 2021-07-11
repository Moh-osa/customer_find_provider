class AddSpecialityMaterialToProviderSpecialities < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE speciality_material AS ENUM ('wood','carpet','tiles');
    SQL
    add_column :provider_specialities, :material, :speciality_material
  end

  def down
    remove_column :provider_specialities, :material
    execute <<-SQL
      DROP TYPE speciality_material;
    SQL
  end
end
