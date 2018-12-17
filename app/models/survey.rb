class Survey < ApplicationRecord
  has_many :questions, inverse_of: :survey, dependent: :destroy

  accepts_nested_attributes_for :questions
end
