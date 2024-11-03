class CommentController < ApplicationController

    def add_comment
        post = Post.find(params[:post_id])
        comment = post.comments.create(content: params[:content], user_id: @current_user.id)

        redirect_to "/post/" + params[:post_id]
    end

end
