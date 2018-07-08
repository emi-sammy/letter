class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(letter_id: params[:letter_id])
    redirect_to letters_url, notice: "#{favorite.letter.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to letters_url, notice: "#{favorite.letter.user.name}さんのブログをお気に入り解除しました"
  end
end
