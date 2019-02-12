class Survey < ApplicationRecord
  has_many :memory_surveys, inverse_of: :survey, dependent: :destroy
  has_many :reading_surveys, inverse_of: :survey, dependent: :destroy
end
