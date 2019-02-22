class SurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def new
    @survey = Survey.find_by(:subject => subject)
    unless @survey
      @survey = Survey.create(:subject => subject)
    end

    @operational = true
    @possibles_memory = []
    @possibles_reading = []
    @reading = true

    if @survey.two_memory < 3
      @possibles_memory << 2
    end
    if @survey.three_memory < 3
      @possibles_memory << 3
    end
    if @survey.four_memory < 3
      @possibles_memory << 4
    end
    if @survey.five_memory < 3
      @possibles_memory << 5
    end
    if @survey.six_memory < 3
      @possibles_memory << 6
    end
    if @survey.seven_memory < 3
      @possibles_memory << 7
    end

    @questions = @possibles_memory.sample

    unless @questions
      @operational = false
    end

    unless @operational
      if @survey.two_reading < 3
        @possibles_reading << 2
      end
      if @survey.three_reading < 3
        @possibles_reading << 3
      end
      if @survey.four_reading < 3
        @possibles_reading << 4
      end
      if @survey.five_reading < 3
        @possibles_reading << 5
      end
      if @survey.six_reading < 3
        @possibles_reading << 6
      end
      if @survey.seven_reading < 3
        @possibles_reading << 7
      end

      @questions = @possibles_reading.sample

      unless @questions
        @reading = false
      end
    end
  end

  def show
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def subject
      begin
        subject = params[:subject]
      rescue
        render :file => "public/401.html", :status => :unauthorized
      end

      subject
    end

    def survey_params
      params.require(:survey).permit(
        :subject,
      )
    end
end
