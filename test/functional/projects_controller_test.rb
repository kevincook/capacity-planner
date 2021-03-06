require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => { :name => "alpha2"}
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, :id => projects(:alpha).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => projects(:alpha).to_param
    assert_response :success
  end

  test "should update project" do
    put :update, :id => projects(:beta).to_param, :project => { }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:alpha).to_param
    end

    assert_redirected_to projects_path
  end
end
