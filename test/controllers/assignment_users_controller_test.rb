require 'test_helper'

class AssignmentUsersControllerTest < ActionController::TestCase
  setup do
    @assignment_user = assignment_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignment_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment_user" do
    assert_difference('AssignmentUser.count') do
      post :create, assignment_user: { assignment_id: @assignment_user.assignment_id, user_id: @assignment_user.user_id }
    end

    assert_redirected_to assignment_user_path(assigns(:assignment_user))
  end

  test "should show assignment_user" do
    get :show, id: @assignment_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assignment_user
    assert_response :success
  end

  test "should update assignment_user" do
    patch :update, id: @assignment_user, assignment_user: { assignment_id: @assignment_user.assignment_id, user_id: @assignment_user.user_id }
    assert_redirected_to assignment_user_path(assigns(:assignment_user))
  end

  test "should destroy assignment_user" do
    assert_difference('AssignmentUser.count', -1) do
      delete :destroy, id: @assignment_user
    end

    assert_redirected_to assignment_users_path
  end
end
