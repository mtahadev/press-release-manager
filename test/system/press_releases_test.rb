require "application_system_test_case"

class PressReleasesTest < ApplicationSystemTestCase
  setup do
    @press_release = press_releases(:one)
  end

  test "visiting the index" do
    visit press_releases_url
    assert_selector "h1", text: "Press releases"
  end

  test "should create press release" do
    visit press_releases_url
    click_on "New press release"

    fill_in "Content", with: @press_release.content
    fill_in "Publish date", with: @press_release.publish_date
    fill_in "Publisher", with: @press_release.publisher_id
    fill_in "Status", with: @press_release.status
    fill_in "Title", with: @press_release.title
    fill_in "User", with: @press_release.user_id
    click_on "Create Press release"

    assert_text "Press release was successfully created"
    click_on "Back"
  end

  test "should update Press release" do
    visit press_release_url(@press_release)
    click_on "Edit this press release", match: :first

    fill_in "Content", with: @press_release.content
    fill_in "Publish date", with: @press_release.publish_date
    fill_in "Publisher", with: @press_release.publisher_id
    fill_in "Status", with: @press_release.status
    fill_in "Title", with: @press_release.title
    fill_in "User", with: @press_release.user_id
    click_on "Update Press release"

    assert_text "Press release was successfully updated"
    click_on "Back"
  end

  test "should destroy Press release" do
    visit press_release_url(@press_release)
    click_on "Destroy this press release", match: :first

    assert_text "Press release was successfully destroyed"
  end
end
