class LikesController < ApplicationController
  def like
  	if Like.where(post_id: params[:post_id], user_id: current_user.id).exists?
	  	puts Like.all
	  	redirect_to "/bright_ideas"
	else
		Like.create(user_id: current_user.id, post_id: params[:post_id])
	  	redirect_to "/bright_ideas"
	end
  end
end
