require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h3", text: "PICK UP"
  end
end
