class MemorySurveysController < ApplicationController
  before_action :set_survey, only: []

  def show
    @memory_survey = MemorySurvey.find(params[:id])
  end

  def new
    @memory_survey = MemorySurvey.new(:subject => subject)

    Setting.first.number_questions.times do
      @memory_survey.memory_questions.build
    end
  end

  def create
    @memory_survey = MemorySurvey.new(survey_params)

    respond_to do |format|
      if @memory_survey.save
        format.html { redirect_to @memory_survey, notice: 'Survey was successfully created.' }
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

    def set_memory_survey
      @memory_survey = MemorySurvey.find(params[:id])
    end

    def survey_params
      params.require(:memory_survey).permit(
        :subject,
        memory_questions_attributes: [
        :id,
        :answer,
        :first,
        :memory,
        :operand,
        :recall,
        :result,
        :second,
        :veracity,
        :_destroy,
        ],
      )
    end
end
