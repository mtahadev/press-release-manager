class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.text :description
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
