  require 'rails_helper'

  describe BallotsController  do
    include Devise::TestHelpers
    include TestFactories

    describe'#up_ballot' do
      it "adds an up-ballot to the post" do
        request.env["HTTP_REFERER"] = '/'
        @user = authenticated_user
        @post = post_without_user
        sign_in @user

        expect {
          post( :up_ballot, post_id: @post.id)
        }.to change{ @post.up_ballots }.by 1
      end
    end  

  end

