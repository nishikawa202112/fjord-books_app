# frozen_string_literal: true

class UserController < ApplicationController
  def show
    @user = current_user
  end
end
