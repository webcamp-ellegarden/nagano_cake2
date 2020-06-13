require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    def setup
    @user = User.new(family_name: "michael", first_name: "hartl", family_name_kana: "マイケル", first_name_kana: "ハートル",
    	 email: "michaelhartl@gmail.com", password: "password", tel: "0000000000", postal_code: "00000000",
    	  prefecture_code: "東京", address_city: "練馬区", address_street: "ダーツ―さん家", user_status: "有効")
  end

  test "should be valild" do
    assert @user.valid?
  end
end
