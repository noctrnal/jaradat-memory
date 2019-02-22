class ReadingSurveysController < ApplicationController
  before_action :set_reading_survey, only: [:show]

  def show
  end

  def new
    @reading_survey = ReadingSurvey.new
    @subject = subject

    questions.to_i.times do
      @reading_survey.reading_questions.build
    end
  end

  def create
    @reading_survey = ReadingSurvey.new(reading_survey_params)
    @reading_survey.survey_id = Survey.find_by(:subject => subject_post_submit).id

    respond_to do |format|
      if @reading_survey.save
        questions = @reading_survey.reading_questions.count

        case questions
        when 2
          @reading_survey.survey.two_reading += 1
        when 3
          @reading_survey.survey.three_reading += 1
        when 4
          @reading_survey.survey.four_reading += 1
        when 5
          @reading_survey.survey.five_reading += 1
        when 6
          @reading_survey.survey.six_reading += 1
        when 7
          @reading_survey.survey.seven_reading += 1
        end

        @reading_survey.survey.save

        format.html { redirect_to new_survey_path :subject => subject_post_submit }
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

    def set_reading_survey
      @reading_survey = ReadingSurvey.find(params[:id])
    end

    def reading_survey_params
      params.require(:reading_survey).permit(
        :survey,
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
        subject = params[:reading_survey][:subject]
      rescue
        render :file => "public/401.html", :status => :unauthorized
      end

      subject
    end
end
