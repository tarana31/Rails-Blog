class PostsController < ApplicationController

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = session[:user_id]
        if @post.save
            redirect_to '/posts'
            flash[:notice]="Posted"
        else
            render '/posts/new'
        end
    end

    def index
        @posts = Post.all
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:notice]= "Post Updated"
            redirect_to posts_path 
        else
            render '/posts/edit' 
        end    
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice]= "Post deleted" 
        redirect_to posts_path 
    end
    

    private

    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end
end
