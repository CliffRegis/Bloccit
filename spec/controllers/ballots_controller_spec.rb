  require 'rails_helper'

  describe BallotsController  do
    include Devise::TestHelpers
    include TestFactories
   
    before do
      @user = authenticated_user
      @post = post_without_user
      sign_in @user
    end

    describe'#up_ballot' do
      it "adds an up-ballot to the post" do
        request.env["HTTP_REFERER"] = '/'
        expect {
        post( :up_ballot, post_id: @post.id)
        }.to change{ @post.up_ballots }.by 1
      end
    end

    describe'#down_ballot' do
      it "adds an down-ballot to the post" do
        request.env["HTTP_REFERER"] = '/'
        expect {
        post( :down_ballot, post_id: @post.id)
        }.to change{ @post.down_ballots }.by -1
      end
    end  
  end
  

