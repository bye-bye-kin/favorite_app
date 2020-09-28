class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
    #current_user.favorites.createに結びついたいいねを作成

    redirect_back(fallback_location: root_path)
    #recipe_idと:user_idの組み合わせは一通りしか作られない、としている
    #投稿詳細画面、投稿一覧画面の２つからいいねができるので、その時いいねしたときの画面に
    #戻るという記述。
  end
  
  def destroy
    @recipe =Recipe.find(params[:recipe_id])
    @favorite =current_user.favorites.find_by(recipe_id: @recipe.id) 
    @favorite.destroy
    redirect_back(fallback_location: root_path)
    #もし一つ前のページが見つからなかったらroot_pathに移動する
  end
end
