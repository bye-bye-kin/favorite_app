class RecipesController < ApplicationController
  def index
    @recipes=Recipe.all
  end

  def show
    @recipes = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_parmas)
    @recipe.user_id =current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: '投稿に失敗しました。'
    else
      render :new
    end   
  end
  
  def edit
  end
end
