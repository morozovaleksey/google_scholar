class ScienceSubject < ActiveRecord::Base
  belongs_to :science_area
  has_many :science_subjects
  validates :science_subject_name, uniqueness: true
end
