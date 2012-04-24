class FormController < ApplicationController
  layout 'with_links'

  def index
  	 @forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def create
  	logger.debug params
  	@form = Form.get_form_by_form_id(params[:form_id]).first
  	@form.fields.each do |field|
  		datum = Datum.new
  		datum.study_id = params[:study_id]
  		datum.form_id = params[:form_id]
  		datum.field_id = field.id
  		datum.data_point = params[field.field_name].to_s
  		datum.save
  	end
  	redirect_to study_form_index_path
  end

end
