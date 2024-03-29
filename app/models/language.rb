# frozen_string_literal: true

class Language < ApplicationRecord
  has_many :groups, dependent: :destroy
  belongs_to :user
end
