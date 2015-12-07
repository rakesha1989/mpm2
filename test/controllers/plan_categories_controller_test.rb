require 'test_helper'

class PlanCategoriesControllerTest < ActionController::TestCase
  setup do
    @plan_category = plan_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_category" do
    assert_difference('PlanCategory.count') do
      post :create, plan_category: { category_id: @plan_category.category_id, plan_id: @plan_category.plan_id }
    end

    assert_redirected_to plan_category_path(assigns(:plan_category))
  end

  test "should show plan_category" do
    get :show, id: @plan_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_category
    assert_response :success
  end

  test "should update plan_category" do
    patch :update, id: @plan_category, plan_category: { category_id: @plan_category.category_id, plan_id: @plan_category.plan_id }
    assert_redirected_to plan_category_path(assigns(:plan_category))
  end

  test "should destroy plan_category" do
    assert_difference('PlanCategory.count', -1) do
      delete :destroy, id: @plan_category
    end

    assert_redirected_to plan_categories_path
  end
end
