class MemorySurveysController < ApplicationController
  before_action :set_memory_survey, only: [:show]

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
        questions = @memory_survey.memory_questions.count

        case questions
        when 2
          @memory_survey.survey.two_memory += 1
        when 3
          @memory_survey.survey.three_memory += 1
        when 4
          @memory_survey.survey.four_memory += 1
        when 5
          @memory_survey.survey.five_memory += 1
        when 6
          @memory_survey.survey.six_memory += 1
        when 7
          @memory_survey.survey.seven_memory += 1
        end

        @memory_survey.survey.save

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
