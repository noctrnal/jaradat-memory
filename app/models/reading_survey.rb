class ReadingSurvey < ApplicationRecord
  has_many :reading_questions, inverse_of: :reading_survey, dependent: :destroy
  belongs_to :survey

  accepts_nested_attributes_for :reading_questions
end
