class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.build(comment_params)
    redirect_back(fallback_location: root_path) if comment.save
  end

  def destroy
    comment.destroy
    redirect_back(fallback_location: root_path)
  end
  def comment_like
    @comment = Comment.find(params[:id])
  if !@comment.likes.find_by(user_id: current_user.id)
    @comment.likes.create(user_id: current_user.id)
  else
    @like = @comment.likes.find_by(user_id: current_user.id)
    @like.destroy
    end
  redirect_back(fallback_location: root_path)
end

def comment_dislike
  @comment = Comment.find(params[:id])
  if !@comment.dislikes.find_by(user_id: current_user.id)
    @comment.dislikes.create(user_id: current_user.id)
  else
    @dislike = @comment.dislikes.find_by(user_id: current_user.id)
    @dislike.destroy
  end
  redirect_back(fallback_location: root_path)
end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :text,:theme_id)
  end

  def comment
    @comment ||= current_user.comments.find_by(id: params[:id])
    @comment ||= Comment.new
  end
end
