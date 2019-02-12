class MemorySurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def show
  end

  def new
    @memory_survey = MemorySurvey.new

    questions.to_i.times do
      @memory_survey.memory_questions.build
    end
  end

  def create
    puts 'MADE IT TO HERE'
    @memory_survey = MemorySurvey.new(memory_survey_params)

    respond_to do |format|
      if @memory_survey.save
        format.html { redirect_to @memory_survey, notice: 'Survey was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def questions
      begin
        questions = params[:questions]
      rescue
        render :file => "public/500.html", :status => :internal_server_error
      end

      questions
    end

    def set_memory_survey
      @memory_survey = MemorySurvey.find(params[:id])
    end

    def memory_survey_params
      params.require(:memory_survey).permit(
        memory_questions_attributes: [
          :id,
          :memory,
          :recall,
          :equation,
          :veracity,
          :_destroy,
        ],
      )
    end
end
