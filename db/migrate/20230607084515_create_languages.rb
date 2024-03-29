# frozen_string_literal: true

class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :language
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
