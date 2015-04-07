class CreateScienceSubjects < ActiveRecord::Migration
  def change
    create_table :science_subjects do |t|
      t.references :science_areas, index: true
      t.string :science_subject_name
      t.timestamps
    end
  end
end
