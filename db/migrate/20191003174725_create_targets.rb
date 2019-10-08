class CreateTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :targets do |t|
      t.belongs_to :topic, null: false, index: true
      t.belongs_to :user, null: false, index: true
      t.string :title, null: false
      t.integer :radius, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
