require "test_helper"

class RecipeStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_step = recipe_steps(:one)
  end

  test "should get index" do
    get recipe_steps_url, as: :json
    assert_response :success
  end

  test "should create recipe_step" do
    assert_difference("RecipeStep.count") do
      post recipe_steps_url, params: { recipe_step: { body: @recipe_step.body, position: @recipe_step.position, recipe_step_id: @recipe_step.recipe_step_id, title: @recipe_step.title } }, as: :json
    end

    assert_response :created
  end

  test "should show recipe_step" do
    get recipe_step_url(@recipe_step), as: :json
    assert_response :success
  end

  test "should update recipe_step" do
    patch recipe_step_url(@recipe_step), params: { recipe_step: { body: @recipe_step.body, position: @recipe_step.position, recipe_step_id: @recipe_step.recipe_step_id, title: @recipe_step.title } }, as: :json
    assert_response :success
  end

  test "should destroy recipe_step" do
    assert_difference("RecipeStep.count", -1) do
      delete recipe_step_url(@recipe_step), as: :json
    end

    assert_response :no_content
  end
end
