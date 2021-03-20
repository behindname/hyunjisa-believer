require 'test_helper'

class PrayRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pray_request = pray_requests(:one)
  end

  test "should get index" do
    get pray_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_pray_request_url
    assert_response :success
  end

  test "should create pray_request" do
    assert_difference('PrayRequest.count') do
      post pray_requests_url, params: { pray_request: {  } }
    end

    assert_redirected_to pray_request_url(PrayRequest.last)
  end

  test "should show pray_request" do
    get pray_request_url(@pray_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_pray_request_url(@pray_request)
    assert_response :success
  end

  test "should update pray_request" do
    patch pray_request_url(@pray_request), params: { pray_request: {  } }
    assert_redirected_to pray_request_url(@pray_request)
  end

  test "should destroy pray_request" do
    assert_difference('PrayRequest.count', -1) do
      delete pray_request_url(@pray_request)
    end

    assert_redirected_to pray_requests_url
  end
end
