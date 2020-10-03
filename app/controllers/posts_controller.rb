class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
	def index
	  @posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new()
	end
	
	def create
		@post = Post.new(post_params)
		if @post.save
		  redirect_to @post 
		else
			redirect_to 'new'
		end
	end
	
	def edit
	end

	def show
	end
	
	def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
	end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title,:content,:is_deleted)
  end 

end
 