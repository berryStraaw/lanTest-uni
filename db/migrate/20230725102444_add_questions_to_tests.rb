# frozen_string_literal: true

class AddQuestionsToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :questions, :string, array: true, default: []
  end
end
