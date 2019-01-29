class ReadingQuestion < ApplicationRecord
  belongs_to :reading_survey
  belongs_to :sentence

  accepts_nested_attributes_for :sentence

  after_initialize :default_values

  private
    def default_values
      self.memory ||= memory_range
      self.sentence ||= fetch_sentence
    end

    def memory_range
      @minimum_value ||= Setting.first.minimum_value
      @maximum_value ||= Setting.first.maximum_value

      [*@minimum_value..@maximum_value].sample
    end

    def fetch_sentence
      Sentence.offset(rand(Sentence.count)).first
    end
end
