class CreateVotes < ActiveRecord::Migration
  def self.down
    drop_table :Votes
  end
end
