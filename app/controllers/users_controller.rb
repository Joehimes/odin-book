class UsersController < ApplicationController
    before_action :authenticate_user!, only: :show

    def show
        @user = current_user
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
        @feed_items = current_user.feed
    end

    def index
        @users = User.all
    end

end
