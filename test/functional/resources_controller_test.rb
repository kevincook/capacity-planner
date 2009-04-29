require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resources)
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post :create, :resource => { 
          :first_name => "bob",
          :last_name  => "bobber"
        }
        
    end
    
    assert_redirected_to resource_path(assigns(:resource))
  end
  
  test "should not create resource missing first or last name" do
    assert_no_difference('Resource.count') do
      post :create, :resource => { 
        }
    end
    
    assert_response :success
  end
  
  test "should show resource" do
    get :show, :id => resources(:bob).to_param
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => resources(:bob).to_param
    assert_response :success
  end
  
  test "should update resource" do
    post :update, :id => resources(:bob).to_param, :resource => { }
    assert_redirected_to resource_path(assigns(:resource))
  end
  
end
