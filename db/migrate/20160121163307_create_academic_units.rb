class CreateAcademicUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :academic_units do |t|
      t.string :code, limit: 10
      t.string :name, limit: 100

      t.timestamps
    end
    add_index :academic_units, :code, unique: true
  end
end
