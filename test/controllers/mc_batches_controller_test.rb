require 'test_helper'

class McBatchesControllerTest < ActionController::TestCase
  setup do
    @mc_batch = mc_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mc_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mc_batch" do
    assert_difference('McBatch.count') do
      post :create, mc_batch: { name: @mc_batch.name, published: @mc_batch.published }
    end

    assert_redirected_to mc_batch_path(assigns(:mc_batch))
  end

  test "should show mc_batch" do
    get :show, id: @mc_batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mc_batch
    assert_response :success
  end

  test "should update mc_batch" do
    patch :update, id: @mc_batch, mc_batch: { name: @mc_batch.name, published: @mc_batch.published }
    assert_redirected_to mc_batch_path(assigns(:mc_batch))
  end

  test "should destroy mc_batch" do
    assert_difference('McBatch.count', -1) do
      delete :destroy, id: @mc_batch
    end

    assert_redirected_to mc_batches_path
  end
end
