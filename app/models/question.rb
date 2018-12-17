class Question < ApplicationRecord
  belongs_to :survey

  after_initialize :default_values

  private
    def calculate_answer
      veracity = [0..1].sample

      veracity ? eval("#{self.first}#{self.operand}#{self.second}") : memory_range
    end

    def default_values
      self.memory ||= memory_range
      self.operand ||= random_operator

      self.first ||= memory_range
      self.second ||= memory_range

      self.answer ||= calculate_answer
    end

    def memory_range
      @minimum_value ||= Setting.first.minimum_value
      @maximum_value ||= Setting.first.maximum_value

      if ["*", "/"].include?(self.operand)
        [*1..12].sample
      else
        [*@minimum_value..@maximum_value].sample
      end
    end

    def random_operator
      operators = ["+", "-", "*", "/"]

      operators.sample
    end
end
