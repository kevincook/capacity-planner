require 'test_helper'

class ResourceAllocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_allocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create resource_allocation" do
  #   assert_difference('ResourceAllocation.count') do
  #     post :create, :resource_allocation => {  }
  #   end
  # 
  #   assert_redirected_to resource_allocation_path(assigns(:resource_allocation))
  # end

  test "should show resource_allocation" do
    get :show, :id => resource_allocations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => resource_allocations(:one).to_param
    assert_response :success
  end

  test "should update resource_allocation" do
    put :update, :id => resource_allocations(:one).to_param, :resource_allocation => { }
    assert_redirected_to resource_allocation_path(assigns(:resource_allocation))
  end

  test "should destroy resource_allocation" do
    assert_difference('ResourceAllocation.count', -1) do
      delete :destroy, :id => resource_allocations(:one).to_param
    end

    assert_redirected_to resource_allocations_path
  end
end
