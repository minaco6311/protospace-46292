class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # コメントの保存に成功した場合
      redirect_to prototype_path(@comment.prototype)
    else
      # コメントの保存に失敗した場合（例：contentが空など）
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    # Strong Parameters（安全にデータを受け取るための設定）
    params.require(:comment).permit(:content).merge(
      user_id: current_user.id,
      prototype_id: params[:prototype_id]
    )
  end
end
