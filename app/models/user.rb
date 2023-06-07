class User < ApplicationRecord
    has_many :languages
    has_many :tests
  end
  