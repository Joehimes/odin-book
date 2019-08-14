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
            redirect_to root_path
        else
            flash.now[:alert] = "There was a problem with your post. Please try again."
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice] = "Post updated!"
            redirect_to root_path
        else
            flash.now[:alert] = "There was a problem updating your post. Please try again."
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.delete
        redirect_to root_path
    end

    private

        def post_params
            params.require(:post).permit(:body)
        end

end
