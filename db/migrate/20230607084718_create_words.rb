# frozen_string_literal: true

class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.references :group, null: false, foreign_key: true
      t.string :name
      t.string :meaning

      t.timestamps
    end
  end
end
