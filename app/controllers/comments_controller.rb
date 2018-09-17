class CommentsController < ApplicationController

    def new
        user = session[:user_id]
        @comment = Comment.new(post_id: params[:post_id])
        @post = Post.find(params[:post_id])

    end

    def index
        @comment = Comment.all 
    end

    def create
        @comment = Comment.new(comment_params)
        @user = User.find(session[:user_id])
        if @comment.save
            flash[:notice] = "comment created."
            redirect_to '/posts'
        else
            flash[:notice] = "Error"
            redirect_to '/posts'
        end
    end

    def show
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update 
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        flash[:notice] = "Comment updated."
        redirect_to '/posts'
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:notice] ="comment deleted"
        redirect_to '/posts'
      end    

    def check_for
        if session[:user_id] != @post.user_id
          flash[:notice] = "You can't edit this comment"
          redirect_to '/posts'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content,:user_id,:post_id)
    end
end
