class FavoritesController < ApplicationController

  def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
     authorize favorite

     if favorite.save
      flash[:notice] = "Great! you favorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Oops! there was an error."
      redirect_to [@post.topic, @post]
    end
  end

  def destroy
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.find(params[:id])
     authorize favorite
     if favorite.destroy
      flash[:notice] = "You 'unfavorited' this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Oops! there was an error."
      redirect_to [@post.topic, @post]
    end
  end

end

