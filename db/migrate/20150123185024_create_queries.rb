class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :user_email
      t.text :query
      t.integer :number_relevant
      t.integer :number_all
      t.integer :number_page
      t.timestamps
    end
  end
end