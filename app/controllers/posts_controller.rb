class PostsController < ApplicationController
 
  
  def index
    @posts = Post.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
   
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :image, :body))
    @post.topic = @topic
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to topics_path, :notice => "Post or Comment was deleted"
  end
 
end


