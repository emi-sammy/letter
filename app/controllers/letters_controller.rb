class LettersController < ApplicationController
  
   before_action :set_letter, only: [:show, :edit, :update, :destroy] 
  
  def index
   @letter = Letter.all
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
    if @letter.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to letters_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end 
 
  
  def show
   @letter=Letter.find(params[:id])
  end
 
  def edit
    @letter = Letter.find(params[:id])
  end
  
  def update
    @letter = Letter.find(params[:id])
    if @letter.update(letter_params)
      redirect_to letters_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
     @letter.destroy
     redirect_to letters_path, notice:"ブログを削除しました！"
  end
    
  def confirm
    @letter= Letter.new(letter_params)
    render :new if @letter.invalid?
  end
  
 
  private
  
   def letter_params
    params.require(:letter).permit(:content)
   end
  
   def set_letter
      @letter = Letter.find(params[:id])
   end
end 