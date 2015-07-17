require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { age: @pet.age, information: @pet.information, name: @pet.name, pet_type_id: @pet.pet_type_id, race_id: @pet.race_id, sex: @pet.sex, state: @pet.state, user_id: @pet.user_id, vaccinated: @pet.vaccinated }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    patch :update, id: @pet, pet: { age: @pet.age, information: @pet.information, name: @pet.name, pet_type_id: @pet.pet_type_id, race_id: @pet.race_id, sex: @pet.sex, state: @pet.state, user_id: @pet.user_id, vaccinated: @pet.vaccinated }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_redirected_to pets_path
  end
end
