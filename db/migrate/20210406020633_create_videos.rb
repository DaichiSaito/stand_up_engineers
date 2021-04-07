class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :category_name
      t.string :title
      t.string :video_id

      t.timestamps
    end
  end
end
