class PostsController < ApplicationController
	  before_action :set_post, only: [:show, :edit, :update, :destroy]

	   # ask yourself if the user should be told something once that specific action is complete
	   # Create the flash message using the following code and insert it just prior to the redirect or render.
	   #  If using the render method, adjust the flash message to flash.now:
	   # flash[:success] = “Your personalised message here”
	   # flash[:alert] = “Oh god something is wrong”

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
    	flash[:succes] = "Your post has been created!"
    	redirect_to posts_path
    else
    	flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      	render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
    	flash[:succes] = "Post updated."
      redirect_to posts_path
    else
    	flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
