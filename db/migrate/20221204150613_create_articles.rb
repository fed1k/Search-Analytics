class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :paragraph
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
