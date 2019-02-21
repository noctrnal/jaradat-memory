class MemorySurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def show
  end

  def new
    @memory_survey = MemorySurvey.new
    @subject = subject

    questions.to_i.times do
      @memory_survey.memory_questions.build
    end
  end

  def create
    @memory_survey = MemorySurvey.new(memory_survey_params)
    @memory_survey.survey_id = Survey.find_by(:subject => subject_post_submit).id

    respond_to do |format|
      if @memory_survey.save
        format.html { redirect_to new_survey_path :subject => subject_post_submit}
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
        :survey,
        memory_questions_attributes: [
          :id,
          :equation,
          :memory,
          :recall,
          :veracity,
          :_destroy,
        ],
      )
    end

    def subject
      begin
        subject = params[:subject]
      rescue
        render :file => "public/401.html", :status => :unauthorized
      end

      subject
    end

    def subject_post_submit
      begin
        subject = params[:memory_survey][:subject]
      rescue
        render :file => "public/401.html", :status => :unauthorized
      end

      subject
    end
end
