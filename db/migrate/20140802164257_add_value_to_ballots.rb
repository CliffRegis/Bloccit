class AddValueToBallots < ActiveRecord::Migration
  def change
    add_column :ballots, :value, :integer
  end
end
