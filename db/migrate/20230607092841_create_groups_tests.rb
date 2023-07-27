# frozen_string_literal: true

class CreateGroupsTests < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_tests do |t|
      t.references :test, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
