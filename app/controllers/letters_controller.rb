class LettersController < ApplicationController
   before_action :login_check, only: [:new, :edit, :show, :destroy]
   before_action :set_letter, only: [:show, :edit, :update, :destroy]

   def top
   end

  def index
   @letter = Letter.all
   @my_favorites = current_user.try(:favorites)
  end

  def new
    if params[:back]
      @letter = Letter.new(letter_params)
    else
      @letter = Letter.new
    end
  end

  def create
    @letter = Letter.new(letter_params)
    @letter.user_id = current_user.id
    #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
    if @letter.save
    # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to letters_path, notice: "作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end


  def show
   @letter=Letter.find(params[:id])
   @user = User.find_by(id: @letter.user_id)
   @favorite = current_user.favorites.find_by(letter_id: @letter.id)


  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])
    if @letter.update(letter_params)
      redirect_to letters_path, notice: "編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
     @letter.destroy
     redirect_to letters_path, notice:"削除しました！"
  end

  def confirm
    @letter= Letter.new(letter_params)
    @letter.user_id = current_user.id
    #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
 #省略
    render :new if @letter.invalid?
  end

  def login_check
   if logged_in?
   else
     redirect_to new_session_path
  end
end


  private

   def letter_params
    params.require(:letter).permit(:content)
   end

   def set_letter
      @letter = Letter.find(params[:id])
   end
end
