class RecipeStepsController < ApplicationController
  before_action :set_recipe_step, only: %i[ show update destroy]

  # GET /recipe_steps
  # GET /recipe_steps.json
  def index
    @recipe_steps = RecipeStep.all
  end



  # GET /recipe_steps/1
  # GET /recipe_steps/1.json
  def show
  end

  # POST /recipe_steps
  # POST /recipe_steps.json
  def create
    @recipe_step = RecipeStep.new(recipe_step_params)

    if @recipe_step.save
      render :show, status: :created, location: @recipe_step
    else
      render json: @recipe_step.errors, status: :unprocessable_entity
    end
  end

  def reorder
    recipe_step_updates = params[:list].map do |l|
      {
        id: l["id"].to_i,
        position: l["position"].to_i,
        recipe_step_id: l["recipe_step_id"].to_i > 0 ? l["recipe_step_id"].to_i : nil
      }
    end

    RecipeStep.upsert_all(recipe_step_updates)

    render status: 200, json: {
      message: "Success!",
    }.to_json
  end

  # PATCH/PUT /recipe_steps/1
  # PATCH/PUT /recipe_steps/1.json
  def update
    if @recipe_step.update(recipe_step_params)
      render :show, status: :ok, location: @recipe_step
    else
      render json: @recipe_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_steps/1
  # DELETE /recipe_steps/1.json
  def destroy
    @recipe_step.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_step_params
      params.require(:recipe_step).permit(:recipe_step_id, :recipe_id, :title, :body, :position)
    end
end
