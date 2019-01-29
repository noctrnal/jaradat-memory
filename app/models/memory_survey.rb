class MemorySurvey < ApplicationRecord
  has_many :memory_questions, inverse_of: :memory_survey, dependent: :destroy

  accepts_nested_attributes_for :memory_questions
end
