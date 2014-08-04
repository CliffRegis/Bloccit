require 'rails_helper'

describe Ballot do 
   include TestFactories

  describe "validations" do
    describe 'value validation' do

    it "only allows -1 or 1 as values" do 
      b = Ballot.new(value: 1) 
      expect( b.valid? ).to eq(true)

      b2 = Ballot.new(value: -1) 
      expect( b2.valid?).to eq(true) 

      bad_b = Ballot.new(value: 2)
      expect(bad_b.valid?).to eq(false)
    end 
  end
end

  describe 'after_save' do 
    it "calls 'Post#update_rank' after save" do 
      post = post_without_user
      ballot = Ballot.new(value:1, post: post) 
      expect(post).to receive(:update_rank) 
        ballot.save
    end 
  end 
end



  