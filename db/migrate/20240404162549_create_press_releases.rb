class CreatePressReleases < ActiveRecord::Migration[7.1]
  def change
    create_table :press_releases do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
