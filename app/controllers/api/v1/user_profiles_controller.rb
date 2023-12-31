class Api::V1::UserProfilesController < ApplicationController
  before_action :authenticate_user, only: [:update]

  def show
    user = current_user
    render json: { name: user.name, profile: user.user_profile }
  end

  def update
    profile = current_user.user_profile || current_user.build_user_profile
    if profile&.update(profile_params)
      render json: profile
    else
      render json: { errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def profile_params
      params.require(:user_profile).permit(:bio, :avatar, :x_link, :facebook_link, :instagram_link)
    end
end
