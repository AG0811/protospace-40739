class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  # ログインしていない状態で遷移できないページ
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # ログインしていない状態でも遷移できるページ
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    # 何も記述しない
    @prototypes = Prototype.all
    # @prototypes = Prototype.includes(:user).order('created_at DESC')
  end

  def new
    @prototype = Prototype.new
  end
  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプを完了しました'
    else
      render :new
    end
  end
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
  end
  def edit
    # @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to action: :index
      # redirect_to root_path, alert: "他のユーザーのプロトタイプは編集できません"
    end
  end
  def update
    # @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプを更新しました'
    else
      render :edit
    end
  end
  def destroy
    # @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプを削除しました'
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id:current_user.id)
  end
end