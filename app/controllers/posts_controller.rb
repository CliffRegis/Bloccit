class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
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
    @topic = Topic.find(params[:id])
    @post = Post.find(params[:id])
    authorize @post, :edit?
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
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
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
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
 
 private
  def set_post
    @post = Post.find(params[:id])
    
  end

  def post_params
    params.require(:post).permit(:title, :id, :name, :image, :body)
  end 
end


