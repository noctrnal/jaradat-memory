class ReadingSurveysController < ApplicationController
  before_action :set_reading_survey, only: []

  def show
  end

  def new
    @reading_survey = ReadingSurvey.new(:subject => subject)

    Setting.first.number_questions.times do
      @reading_survey.reading_questions.build
    end
  end

  def create
    @reading_survey = ReadingSurvey.new(reading_survey_params)

    respond_to do |format|
      if @reading_survey.save
        format.html { redirect_to @reading_survey, notice: 'Reading survey was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def subject
      begin
        subject = params[:subject]
      rescue
        render :file => "public/401.html", :status => :unauthorized
      end

      subject
    end

    def set_reading_survey
      @reading_survey = ReadingSurvey.find(params[:id])
    end

    def reading_survey_params
      params.require(:reading_survey).permit(
        :subject,
        reading_questions_attributes: [
        :id,
        :memory,
        :recall,
        :sentence,
        :veracity,
        :_destroy,
        ],
      )
    end
end