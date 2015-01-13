class RelatedListController < ApplicationController

  def related_subjects_list
    render json: ScienceSubject.where("science_areas_id = #{params[:science_id]}")
  end

end