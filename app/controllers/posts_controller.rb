class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
        @post = Post.new
    end

    def create
        @user = current_user
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:notice] = "Post created successfully!"
            redirect_to current_user
        else
            flash.now[:alert] = "There was a problem with your post. Please try again."
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

        def post_params
            params.require(:post).permit(:body)
        end

end
