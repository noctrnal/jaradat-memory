class ReadingQuestion < ApplicationRecord
  belongs_to :reading_survey

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
      "Ducks wear shoes."
    end
end
