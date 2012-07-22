require 'test_helper'

class ParametersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Parameter.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Parameter.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Parameter.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to parameter_url(assigns(:parameter))
  end

  def test_edit
    get :edit, :id => Parameter.first
    assert_template 'edit'
  end

  def test_update_invalid
    Parameter.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Parameter.first
    assert_template 'edit'
  end

  def test_update_valid
    Parameter.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Parameter.first
    assert_redirected_to parameter_url(assigns(:parameter))
  end

  def test_destroy
    parameter = Parameter.first
    delete :destroy, :id => parameter
    assert_redirected_to parameters_url
    assert !Parameter.exists?(parameter.id)
  end
end
