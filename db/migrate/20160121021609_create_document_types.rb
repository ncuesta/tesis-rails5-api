class CreateDocumentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :document_types do |t|
      t.integer :code, unique: true
      t.string :name, limit: 50, unique: true
      t.string :abbreviation, limit: 5, unique: true

      t.timestamps
    end
  end
end
