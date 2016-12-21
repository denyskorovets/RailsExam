class PostsController < ApplicationController
  def index
  	@posts = Post.all
    @likes = Like.all
  	render "bright_ideas"
  end

  def show
    @post = Post.find(params[:id])
    @likes = Like.where(post_id:params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	@post.author = current_user.id
  	@post.user = current_user
  	@post.save
  	redirect_to '/bright_ideas'
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/bright_ideas'
  end


  def post_params
    params.require(:post).permit(:description, :author)
  end
end
