class CreateSubjectAreas < ActiveRecord::Migration
  def change
    create_table :subject_areas do |t|
      t.string  :subject_area_name
      t.timestamps
    end
  end
end
