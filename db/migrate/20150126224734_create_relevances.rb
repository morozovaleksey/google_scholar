class CreateRelevances < ActiveRecord::Migration
  def change
    create_table :relevances do |t|
      t.string :user_email
      t.text :query
      t.string :specify_query
      t.float :relevance
      t.timestamps
    end
  end
end
