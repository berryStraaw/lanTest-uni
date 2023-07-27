# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :words, dependent: :destroy
  has_and_belongs_to_many :groups, dependent: :destroy
  has_many :tests_words, dependent: :destroy

  has_many :tests_words
  has_many :words, through: :tests_words

end
