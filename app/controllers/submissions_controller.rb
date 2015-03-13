class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end
  def new
    @fields = SurveyTemplate.first.survey_fields
  end
  def create
    #@responses = []
    s = Submission.create
    params[:submission].each do |submission|
      id = SurveyField.find_the_id(submission[0])
      response = FieldResponse.create(:response => submission[1])
      response.survey_field_id = id
      response.submission_id = s.id
      #@responses.push(SurveyField.find_the_id(submission[0]))
      #@responses.push(submission[1])
    end
    flash[:notice] = "Your submission was recorded."
    redirect_to submissions_path
  end 

end
