require 'test_helper'

class PlanAssignmentsControllerTest < ActionController::TestCase
  setup do
    @plan_assignment = plan_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plan_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plan_assignment" do
    assert_difference('PlanAssignment.count') do
      post :create, plan_assignment: { assignment_id: @plan_assignment.assignment_id, plan_id: @plan_assignment.plan_id }
    end

    assert_redirected_to plan_assignment_path(assigns(:plan_assignment))
  end

  test "should show plan_assignment" do
    get :show, id: @plan_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plan_assignment
    assert_response :success
  end

  test "should update plan_assignment" do
    patch :update, id: @plan_assignment, plan_assignment: { assignment_id: @plan_assignment.assignment_id, plan_id: @plan_assignment.plan_id }
    assert_redirected_to plan_assignment_path(assigns(:plan_assignment))
  end

  test "should destroy plan_assignment" do
    assert_difference('PlanAssignment.count', -1) do
      delete :destroy, id: @plan_assignment
    end

    assert_redirected_to plan_assignments_path
  end
end
