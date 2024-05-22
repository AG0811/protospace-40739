class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @prototype, notice: 'コメントを投稿しました'
      # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです
      # redirect_to tweet_path(@comment.tweet)
    else
      # @comments = @prototype.comments.includes(:user)
      # views/tweets/show.html.erbのファイルを参照しています。
      flash[:alert] = @comment.errors.full_messages.join(', ')
      # render "tweets/show"
      render 'prototypes/show'
    end
  end
  def show
    @prototype = Prototype.find(params[:prototype_id])
    # @comment = @prototype.comments.includes(:user)
    @comment = @prototype.comments
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
  def comment_params
    # params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: @prototype.id)

    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
