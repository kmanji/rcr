require 'test_helper'

class BookcoversControllerTest < ActionController::TestCase
  setup do
    @bookcover = bookcovers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookcovers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookcover" do
    assert_difference('Bookcover.count') do
      post :create, bookcover: { description: @bookcover.description, meta_tags: @bookcover.meta_tags, user_id: @bookcover.user_id }
    end

    assert_redirected_to bookcover_path(assigns(:bookcover))
  end

  test "should show bookcover" do
    get :show, id: @bookcover
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookcover
    assert_response :success
  end

  test "should update bookcover" do
    patch :update, id: @bookcover, bookcover: { description: @bookcover.description, meta_tags: @bookcover.meta_tags, user_id: @bookcover.user_id }
    assert_redirected_to bookcover_path(assigns(:bookcover))
  end

  test "should destroy bookcover" do
    assert_difference('Bookcover.count', -1) do
      delete :destroy, id: @bookcover
    end

    assert_redirected_to bookcovers_path
  end
end
