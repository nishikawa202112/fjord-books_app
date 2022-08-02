# frozen_string_literal: true

class UserRelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:id])
    current_user.follow(other_user)
    flash[:notice] = t('controllers.common.notice_create', name: User.human_attribute_name(:follow))
    redirect_to users_path
  end

  def destroy
    other_user = User.find(params[:id])
    current_user.unfollow(other_user)
    flash[:notice] = t('controllers.common.notice_destroy', name: User.human_attribute_name(:follow))
    redirect_to users_path
  end
end
