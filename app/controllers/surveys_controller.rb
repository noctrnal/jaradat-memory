class SurveysController < ApplicationController
  before_action :set_survey, only: []

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new(:subject => subject)

    Setting.first.number_questions.times do
      @survey.questions.build
    end
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    puts survey_params

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
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

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      # params.fetch(:survey, {})
      params.require(:survey).permit(
        :subject,
        questions_attributes: [
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
