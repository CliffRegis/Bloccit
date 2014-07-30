class CommentsController < ApplicationController
  
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topics_path, :notice => "deleted"
  end

  def comment_params
    params.require(:comment).permit(:user_id, :id, :name, :post_id, :body)
  end
end


