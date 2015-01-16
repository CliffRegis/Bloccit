class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comments = @post.comments
    @comment.post = @post
      @new_comment = Comment.new
    @comment.user_id = current_user.id 
    authorize @comment

    if @comment.save
      flash[:notice] = 'Comment was saved'
    else
      flash[:error] = 'Comment failed'
    end
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post]}
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment was not removed."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post]}
    end
  end

  def comment_params
    params.require(:comment).permit(:user_id, :id, :name, :post_id, :body)
  end

end


