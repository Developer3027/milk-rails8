require "application_system_test_case"

class InfoTest < ApplicationSystemTestCase
  test "visiting the welcome page" do
    visit info_welcome_url

    assert_selector "h2", text: "Welcome"
    assert_text "Welcome to the Rogue Media Lab."
  end
end
