class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
     
      t.references :user
      t.references :post
      
    end
    add_index :ballots, :user_id
    add_index :ballots, :post_id

  end
end
