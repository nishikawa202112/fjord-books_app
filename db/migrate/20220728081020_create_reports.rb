class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
