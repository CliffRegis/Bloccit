require 'rails_helper'

  describe Vote do 
    describe "validations" do
      describe 'value validation' do

      it "only allows -1 or 1 as values" do 
        b = Vote.new(value: 1) 
        expect( b.valid? ).to eq(true)

        b2 = Vote.new(value: -1) 
        expect( b2.valid?).to eq(true) 

        bad_b = Vote.new(value: 2)
        expect(bad_b.valid?).to eq(false)
      end 
    end

   
    describe 'after_save' do 
      it "calls 'Post#update_rank' after save" do 
        @post = post_without_user
        vote = Ballot.new(value: 1, post: post) 
        expect(post).to receive(:update_rank) 
          Ballot.save
      end 
    end 
end


