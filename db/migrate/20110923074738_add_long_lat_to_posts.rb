class AddLongLatToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :posts, :gmaps, :boolean
  end
end
