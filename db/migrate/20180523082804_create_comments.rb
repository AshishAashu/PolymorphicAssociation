class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.string :comment_body
      t.string :user_name

      t.timestamps
    end
  end
end
