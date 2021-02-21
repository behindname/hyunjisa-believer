require 'test_helper'

class BelieversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @believer = believers(:one)
  end

  test "should get index" do
    get believers_url
    assert_response :success
  end

  test "should get new" do
    get new_believer_url
    assert_response :success
  end

  test "should create believer" do
    assert_difference('Believer.count') do
      post believers_url, params: { believer: { addressDetail: @believer.addressDetail, addressProvince: @believer.addressProvince, birthday: @believer.birthday, dharmaName: @believer.dharmaName, email: @believer.email, ganzhi: @believer.ganzhi, gender: @believer.gender, name: @believer.name, phone: @believer.phone, registerday: @believer.registerday, remarks: @believer.remarks, temple_id: @believer.temple_id } }
    end

    assert_redirected_to believer_url(Believer.last)
  end

  test "should show believer" do
    get believer_url(@believer)
    assert_response :success
  end

  test "should get edit" do
    get edit_believer_url(@believer)
    assert_response :success
  end

  test "should update believer" do
    patch believer_url(@believer), params: { believer: { addressDetail: @believer.addressDetail, addressProvince: @believer.addressProvince, birthday: @believer.birthday, dharmaName: @believer.dharmaName, email: @believer.email, ganzhi: @believer.ganzhi, gender: @believer.gender, name: @believer.name, phone: @believer.phone, registerday: @believer.registerday, remarks: @believer.remarks, temple_id: @believer.temple_id } }
    assert_redirected_to believer_url(@believer)
  end

  test "should destroy believer" do
    assert_difference('Believer.count', -1) do
      delete believer_url(@believer)
    end

    assert_redirected_to believers_url
  end
end
