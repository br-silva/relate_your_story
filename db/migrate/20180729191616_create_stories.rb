class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title, limit: 65
      t.text :body, null: false

      t.timestamps
    end
  end
end
