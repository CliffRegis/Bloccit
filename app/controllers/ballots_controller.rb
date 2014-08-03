class BallotsController < ApplicationController
  before_action :load_post_and_vote

  def up_ballot
    if @ballot
      @ballot.update_attribute(:value, 1)
    else
    @ballot = current_user.ballots.create(value: 1, post: @post)
    end
    redirect_to :back
  end
  

  def down_ballot
    if @ballot
      @ballot.update_attribute(:value, -1)
    else
      @ballot = current_user.ballots.create(value: -1, post: @post)
    end
    redirect_to :back
  end
 

  private

  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @ballot = @post.ballots.where(user_id: current_user.id).first
  end

  def update_ballot!(new_value)
    if @ballot 
      authorize @ballot, :update?
      @ballot.update_attribute(:value, new_value)
    else
      @ballot = current_user.ballots.build(value: new_value, post: @post)
      authorize @ballot, :create?
      @ballot.save
    end
  end    

end  
