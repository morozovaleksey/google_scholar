class CreateScienceTerms < ActiveRecord::Migration
  def change
    create_table :science_terms do |t|
      t.references :science_subjects, index: true
      t.string :term_name
      t.timestamps
    end
  end
end
