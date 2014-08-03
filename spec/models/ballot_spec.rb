require 'rails_helper'

describe Ballot do
  describe "validation" do
    
    before do
        @b = Ballot.create(value)
        up_ballot = ballot(value: 1)
        down_ballot = ballot(value: -1)
    end
    

    describe "#up_ballots" do
      it "true for an up ballot"
       expect(@b.up_ballot).should be_true
      end
      it "false for a down ballot" do
        expect(@b.up_ballot).should be_false
    end
    
    describe "#down_ballots" do
      it "true for an down ballot"
      expect(@b.down_ballot).should be_true
    end
      it "false for a up ballot" do
     expect(@b.down_ballot).should be_false
    end
  end
end
















