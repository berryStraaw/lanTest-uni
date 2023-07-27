# frozen_string_literal: true

class CreateWordsTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_words do |t|
      t.references :word, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
