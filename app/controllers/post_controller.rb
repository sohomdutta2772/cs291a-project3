class PostController < ApplicationController
    def index
        @posts = Post.order(:created_at)
    end

    def create_post_page
    end

    def handle_create_post
        @post = Post.new({:content => params[:content], :user => @current_user})
        if !@post.save
            puts @post.errors.full_messages
        end
        redirect_to root_path
    end

    def view_post
        @post = Post.find_by_id(params[:id])
    end
end
