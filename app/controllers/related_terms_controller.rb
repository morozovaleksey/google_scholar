class RelatedTermsController < ApplicationController

  def related_terms_list
    render json: ScienceTerm.where("science_subjects_id = #{params[:subject_id]}")
  end

end