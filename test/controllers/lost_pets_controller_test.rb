require 'test_helper'

class LostPetsControllerTest < ActionController::TestCase
  setup do
    @lost_pet = lost_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lost_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lost_pet" do
    assert_difference('LostPet.count') do
      post :create, lost_pet: { district_id: @lost_pet.district_id, found_date: @lost_pet.found_date, info: @lost_pet.info, latitude: @lost_pet.latitude, longitude: @lost_pet.longitude, lost_date: @lost_pet.lost_date, pet_id: @lost_pet.pet_id, report_date: @lost_pet.report_date, status: @lost_pet.status, user_id: @lost_pet.user_id }
    end

    assert_redirected_to lost_pet_path(assigns(:lost_pet))
  end

  test "should show lost_pet" do
    get :show, id: @lost_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lost_pet
    assert_response :success
  end

  test "should update lost_pet" do
    patch :update, id: @lost_pet, lost_pet: { district_id: @lost_pet.district_id, found_date: @lost_pet.found_date, info: @lost_pet.info, latitude: @lost_pet.latitude, longitude: @lost_pet.longitude, lost_date: @lost_pet.lost_date, pet_id: @lost_pet.pet_id, report_date: @lost_pet.report_date, status: @lost_pet.status, user_id: @lost_pet.user_id }
    assert_redirected_to lost_pet_path(assigns(:lost_pet))
  end

  test "should destroy lost_pet" do
    assert_difference('LostPet.count', -1) do
      delete :destroy, id: @lost_pet
    end

    assert_redirected_to lost_pets_path
  end
end
