# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :language, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
