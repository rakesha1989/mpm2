require 'test_helper'

class MeetingUsersControllerTest < ActionController::TestCase
  setup do
    @meeting_user = meeting_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_user" do
    assert_difference('MeetingUser.count') do
      post :create, meeting_user: { meeting_id: @meeting_user.meeting_id, user_id: @meeting_user.user_id }
    end

    assert_redirected_to meeting_user_path(assigns(:meeting_user))
  end

  test "should show meeting_user" do
    get :show, id: @meeting_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_user
    assert_response :success
  end

  test "should update meeting_user" do
    patch :update, id: @meeting_user, meeting_user: { meeting_id: @meeting_user.meeting_id, user_id: @meeting_user.user_id }
    assert_redirected_to meeting_user_path(assigns(:meeting_user))
  end

  test "should destroy meeting_user" do
    assert_difference('MeetingUser.count', -1) do
      delete :destroy, id: @meeting_user
    end

    assert_redirected_to meeting_users_path
  end
end
