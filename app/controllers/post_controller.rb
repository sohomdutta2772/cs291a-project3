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

    def edit_post
        @post = Post.find(params[:id])
    end 

    def update_post
        @post = Post.find(params[:id])

        if @post.update(parameters)
            redirect_to post_path(@post)
        end 
    end

    def delete_post
        @post = Post.find(params[:id])

        if @current_user.id != @post.user_id
            head :forbidden
        end

        if @post.delete()
            redirect_to post_path(@post)
        end
    end

    private 
    def parameters
        params.require(:post).permit(:content)
    end 

end
