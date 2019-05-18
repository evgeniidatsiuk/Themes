class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    redirect_back(fallback_location: root_path) if @comment.save
   end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :object_id, :object_type, :text)
  end
end
