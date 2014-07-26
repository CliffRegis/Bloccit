class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user_id, :post, index: true
      add_index :posts, :user_id
      t.timestamps
    end
  end
end
