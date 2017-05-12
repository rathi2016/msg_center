class CommentsController < ApplicationController
  before_action :find_msg, only: [:edit, :update, :destroy]

  def new
  end

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      redirect_to message_path(@message)
    else
      render 'edit'
    end
  end

  def destroy

  end
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  def find_msg
    @message = Message.find(params[:message_id])
  end
  def find_comment
    @comment = @message.comments.find(params[:id])
  end
end
