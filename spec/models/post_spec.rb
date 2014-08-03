require 'rails_helper'

describe Post do 
  describe "ballot methods" do

    before do
      @post = Post.create(title: 'Post title', body: 'Post bodies must be pretty long.')
      3.times {@post.ballots.create(value: 1) }
      2.times {@post.ballots.create(value:-1) }
    end

    describe '#up_ballots' do
      it "counts the number of ballots with value = 1" do
        expect( @post.up_ballots ).to eq(3)
      end
    end

    describe '#down_ballots' do
      it "counts the number of ballots with value = -1" do
        expect( @post.up_ballots ).to eq(2)
      end
    end

    describe '#points' do
      it "returns the total of all up and down ballots" do
        expect( @post.points ).to eq(1)
      end
    end
  end
end