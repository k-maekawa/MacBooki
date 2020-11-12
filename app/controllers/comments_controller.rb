class CommentsController < ApplicationController

   before_action :authenticate_user

  def create
    logger.debug "*"*100
    logger.debug "[comments_controller.rb]"
    logger.debug "*"*100
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      logger.debug "saved"
      flash[:notice] = "コメントしました"
      redirect_to(post)
    else
      logger.debug "failed"
      flash[:notice] = "コメントできませんでした"
      redirect_to(post)
    end
  end

  def destroy
   comment = Comment.find(params[:id])
   comment.destroy
   flash[:notice] = "コメントを削除しました"
   redirect_to("/posts/index")
 end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
  logger.debug "*"*100
end
