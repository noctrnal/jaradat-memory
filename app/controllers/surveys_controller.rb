class SurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def new
    @survey = Survey.new(:subject => subject)

    # @survey.memory_survey.new(:number_of_questions => 2)
    redirect_to controller: 'memory_surveys', action: 'new', questions: '2'
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
