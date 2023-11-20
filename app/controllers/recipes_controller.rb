class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show update destroy steps]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all.order("position ASC")
  end

  def steps
    render json: @recipe, serializer: RecipeSerializer, steps: true
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render :show, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      render :show, status: :ok, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
  end


  def reorder
    recipe_updates = params[:list].map do |l|
      {
        id: l["id"].to_i,
        position: l["position"].to_i,
        recipe_id: l["recipe_id"].to_i > 0 ? l["recipe_id"].to_i : nil
      }
    end

    Recipe.upsert_all(recipe_updates)

    render status: 200, json: {
      message: "Success!",
    }.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:recipe_id, :title, :body, :header, :position)
    end
end
