class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.references :group, null: false, foreign_key: true
      t.string :name
      t.string :answers, array: true, default: []
      t.string :input, array: true, default: []

      t.timestamps
    end
  end
end
