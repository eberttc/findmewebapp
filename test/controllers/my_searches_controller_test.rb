require 'test_helper'

class MySearchesControllerTest < ActionController::TestCase
  setup do
    @my_search = my_searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_search" do
    assert_difference('MySearch.count') do
      post :create, my_search: { lost_pet_id: @my_search.lost_pet_id, user_id: @my_search.user_id }
    end

    assert_redirected_to my_search_path(assigns(:my_search))
  end

  test "should show my_search" do
    get :show, id: @my_search
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_search
    assert_response :success
  end

  test "should update my_search" do
    patch :update, id: @my_search, my_search: { lost_pet_id: @my_search.lost_pet_id, user_id: @my_search.user_id }
    assert_redirected_to my_search_path(assigns(:my_search))
  end

  test "should destroy my_search" do
    assert_difference('MySearch.count', -1) do
      delete :destroy, id: @my_search
    end

    assert_redirected_to my_searches_path
  end
end
