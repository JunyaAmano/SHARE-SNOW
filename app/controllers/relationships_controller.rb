class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    @id_name = "#follow-link-#{@user.id}"
    @id_name2 = ".follower-count-#{@user.id}"
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    @id_name = "#follow-link-#{@user.id}"
    @id_name2 = ".follower-count-#{@user.id}"
    current_user.unfollow(@user)
  end

end
