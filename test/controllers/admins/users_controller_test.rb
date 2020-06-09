require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @admin = admin(:michael)
  end

  test "login with valid information" do
    get new_admin_session_path
    post admin_session_path, params: { session: { email:    @admin.email,
                                          password: 'password' } }
    follow_redirect!
    assert_template 'asmins/home/top'

  end

end
