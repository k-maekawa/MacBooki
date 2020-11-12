class ChangeDataPrefectureToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :prefecture, :text
  end
end
