class PagesController < ApplicationController
  def about
  		#@Felix = "My name is Felix"
  		#render :contact
  end

  def index
  	if user_signed_in? 
  		redirect_to posts_path
  	else
  		redirect_to_new_user_session_path
  	end 
  end

  def contact
  		#@Felix = "Felix The Awesome"
  end

end
