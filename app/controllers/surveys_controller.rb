class SurveysController < ApplicationController
  before_action :set_survey, only: [:show]

  def new
    @survey = Survey.find_by(:subject => subject)
    unless @survey
      @survey = Survey.create(:subject => subject)
    end

    # add question logic here
    @possibles = []

    if @survey.two < 3
      @possibles << 2
    end
    if @survey.three < 3
      @possibles << 3
    end
    if @survey.four < 3
      @possibles << 4
    end
    if @survey.five < 3
      @possibles << 5
    end
    if @survey.six < 3
      @possibles << 6
    end
    if @survey.seven < 3
      @possibles << 7
    end

    @questions = @possibles.sample

    #case @questions
    #when 2
    #  @survey.two += 1
    #when 3
    #  @survey.three += 1
    #when 4
    #  @survey.four += 1
    #when 5
    #  @survey.five += 1
    #when 6
    #  @survey.six += 1
    #when 7
    #  @survey.seven += 1
    #end

    #@survey.save

    @operational = true

    unless @questions
      @operational = false
    end

    # add logic for reading span
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
