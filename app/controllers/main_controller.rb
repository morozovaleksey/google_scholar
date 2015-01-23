class MainController < ApplicationController
  before_filter :authenticate_user!
  def index
    science_area_model = ScienceArea.all
    @science_area = []
    science_area_model.each_with_index  do |area,index|
      @science_area[index]= {id: area.id, name: area.science_area_name}
    end
    gon.science_area = @science_area
  end
end
