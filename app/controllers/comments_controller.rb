class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create(comment_params)

    if comment.save
      flash[:notice] = "Comment was successfully posted"
      redirect_to @post
      CommentsMailer.submitted(comment).deliver_later
    else
      flash[:alert] = "Comment failed to post #{comment.errors.full_messages}"
      redirect_to @post
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body).merge(user: current_user)
    end
end
