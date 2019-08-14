class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def new
        @profile = Profile.new
    end

    def create
        user = current_user
        @profile = user.build_profile(profile_params)
        if @profile.save
            flash[:notice] = "Profile created!"
            redirect_to root_path
        else
            flash.now[:alert] = "There was an error with your profile. Please try again."
            render 'new'
        end
    end

    private

        def profile_params
            params.require(:profile).permit(:name, :location, :age)
        end

end
