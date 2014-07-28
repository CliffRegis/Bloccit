class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id 
    if @comment.save
      redirect_to [@post.topic, @post], notice: 'Comment was saved'
    else
      redirect_to [@post.topic, @post], alert: 'Comment failed'
    end
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :body)
  end
end


