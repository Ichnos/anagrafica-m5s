require 'test_helper'

class ActivistsControllerTest < ActionController::TestCase
  setup do
    @activist = activists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activist" do
    assert_difference('Activist.count') do
      post :create, activist: { birth_city: @activist.birth_city, birth_date: @activist.birth_date, email: @activist.email, facebook: @activist.facebook, google_plus: @activist.google_plus, meet_up: @activist.meet_up, mov_five_star: @activist.mov_five_star, name: @activist.name, skype: @activist.skype, surname: @activist.surname, twitter: @activist.twitter, username: @activist.username, whatsApp: @activist.whatsApp }
    end

    assert_redirected_to activist_path(assigns(:activist))
  end

  test "should show activist" do
    get :show, id: @activist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activist
    assert_response :success
  end

  test "should update activist" do
    patch :update, id: @activist, activist: { birth_city: @activist.birth_city, birth_date: @activist.birth_date, email: @activist.email, facebook: @activist.facebook, google_plus: @activist.google_plus, meet_up: @activist.meet_up, mov_five_star: @activist.mov_five_star, name: @activist.name, skype: @activist.skype, surname: @activist.surname, twitter: @activist.twitter, username: @activist.username, whatsApp: @activist.whatsApp }
    assert_redirected_to activist_path(assigns(:activist))
  end

  test "should destroy activist" do
    assert_difference('Activist.count', -1) do
      delete :destroy, id: @activist
    end

    assert_redirected_to activists_path
  end
end
