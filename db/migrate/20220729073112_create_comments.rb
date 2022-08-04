class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :message
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
