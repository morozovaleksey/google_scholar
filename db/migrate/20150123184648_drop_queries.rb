class DropQueries < ActiveRecord::Migration
  def change
    drop_table :queries
  end
end
