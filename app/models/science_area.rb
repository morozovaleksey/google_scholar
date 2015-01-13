class ScienceArea < ActiveRecord::Base
  has_many :science_subjects
  validates :science_area_name, uniqueness: true
end
