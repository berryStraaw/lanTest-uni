# frozen_string_literal: true

class Word < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :tests, dependent: :destroy
  belongs_to :group
  has_many :tests_words
  has_many :tests, through: :tests_words
end
