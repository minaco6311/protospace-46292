class PrototypesController < ApplicationController
  # ログインしていないと使えないアクションを指定
  before_action :authenticate_user!, except: [:index, :show]
  # 投稿者以外がeditやdestroyにアクセスしたらトップにリダイレクト
  before_action :move_to_index, only: [:edit, :destroy]

  # 一覧ページ
  def index
    @prototypes = Prototype.all
  end

  # 新規投稿ページ
  def new
    @prototype = Prototype.new
  end

  # 投稿の保存処理
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 詳細ページ
  def show
    @prototype = Prototype.find(params[:id])
    @comment   = Comment.new
    @comments  = @prototype.comments.includes(:user)
  end

  # 編集ページ
  def edit
    @prototype = Prototype.find(params[:id])
  end

  # 更新処理
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  # ストロングパラメータの設定
  def prototype_params
    params.require(:prototype)
          .permit(:title, :catch_copy, :concept, :image)
          .merge(user_id: current_user.id)
  end

  # 投稿者以外が編集・削除ページにアクセスしたらトップへ
  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end
end
