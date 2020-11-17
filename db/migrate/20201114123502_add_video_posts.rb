class AddVideoPosts < ActiveRecord::Migration[6.0]
  def change
     add_column :posts, :video, :binary
  end
end
