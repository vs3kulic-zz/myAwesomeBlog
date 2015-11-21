class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy] #replaces @post = Post.find(params[:id])

  def index
  	@posts = Post.all.order('created_at DESC')
  end

  def new 
  	@post = Post.new
  end 

  def create 
     @post = Post.new(post_params)

  	if @post.save
       flash[:notice] ='Post successfully created!'
       redirect_to post_path(@post)
    else 
      render :new
    end

  end

  def edit 
    #@post = Post.find(params[:id])
  end  

  def update
    #@post = Post.find(params[:id])
    if @post.update(post_params)
        flash[:notice] ='Post successfully updated!'
        redirect_to post_path(@post)
    else
      render :edit
    end
  
  end 

  def destroy 
    #@post = Post.find(params[:id])
    @post.destroy
    flash[:notice] ='Post deleted.'
    redirect_to posts_path
  end 

  def show
  	#@post = Post.find(params[:id])
  end



  private 

  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
  	params.require(:post).permit(:title, :body)
  end 

end
