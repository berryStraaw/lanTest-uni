# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :language
  has_many :words, dependent: :destroy
  has_and_belongs_to_many :tests, dependent: :destroy

  before_destroy :remove_associated_tests
  private

  def remove_associated_tests
    tests.clear
  end
end
