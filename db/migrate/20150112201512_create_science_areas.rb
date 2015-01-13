class CreateScienceAreas < ActiveRecord::Migration
  def change
    create_table :science_areas do |t|
      t.string :science_area_name
      t.timestamps
    end
  end
end
