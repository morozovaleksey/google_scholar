class DropRelevance < ActiveRecord::Migration
  def change
    drop_table :relevances
  end
end
