class PostController < ApplicationController
    before_action :fix_post_id, only: [:edit_post, :update_post, :delete_post]
    before_action :check_is_right_user!, only: [:edit_post, :update_post, :delete_post]

    def index
        @posts = Post.order(:created_at)
    end

    def create_post_page
    end

    def handle_create_post
        @post = Post.new({:content => params[:content], :user => @current_user})
        flash[:failure] = false
        if !@post.save
            flash[:failure] = true
        end
        redirect_to root_path
    end

    def view_post
        @post = Post.find_by_id(params[:id])
        if @post.nil?
            render plain: "404 Not Found", status: :not_found
        end
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

        @post.destroy
        
        redirect_to root_path
    end

    def check_is_right_user!
        if @post.user != current_user
            redirect_to root_path, alert: "Cannot edit other people's posts"
        end 
    end 

    def fix_post_id
        @post = Post.find(params[:id])
    end 

    private 
    def parameters
        params.require(:post).permit(:content)
    end 

end