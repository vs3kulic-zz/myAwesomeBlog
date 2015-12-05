class CommentsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

 def create 
     @post = Post.find(params[:post_id])
     @comment = @post.comments.create(comment_params)

     flash[:notice] = 'Comment has been created.'

     redirect_to post_path(@post)
 end

 def destroy
 	 @post = Post.find(params[:post_id])
 	 @comment = @post.comments.find(params[:id])
 	 @comment.destroy

 	 flash[:notice] = 'Comment has been deleted.'

 	 redirect_to post_path(@post)
 end
  

  private 

  def comment_params
  	params.require(:comment).permit(:name, :body)
  end

end 
