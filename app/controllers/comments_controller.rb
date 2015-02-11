class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment was saved"
    else
      flash[:alert] = 'Comment failed'
      redirect_to [@post.topic, @post]
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


