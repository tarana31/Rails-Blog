class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.create(comment_params)
        redirect_to '/posts'
    end

    def show
    end

    def edit
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id,:post_id,:content)
    end
end
