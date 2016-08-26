class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.string :analysis_emotion
      t.string :analysis_sentiment

      t.timestamps null: false
    end
  end
end
