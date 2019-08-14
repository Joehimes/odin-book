class UsersController < ApplicationController
    before_action :authenticate_user!, only: :show

    def show
        @user = current_user
    end

    def index
        @users = User.all
    end

end
