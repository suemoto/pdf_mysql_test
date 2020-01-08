require "application_system_test_case"

class MyfilesTest < ApplicationSystemTestCase
  setup do
    @myfile = myfiles(:one)
  end

  test "visiting the index" do
    visit myfiles_url
    assert_selector "h1", text: "Myfiles"
  end

  test "creating a Myfile" do
    visit myfiles_url
    click_on "New Myfile"

    fill_in "Comment", with: @myfile.comment
    fill_in "Filename", with: @myfile.filename
    fill_in "Title", with: @myfile.title
    click_on "Create Myfile"

    assert_text "Myfile was successfully created"
    click_on "Back"
  end

  test "updating a Myfile" do
    visit myfiles_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @myfile.comment
    fill_in "Filename", with: @myfile.filename
    fill_in "Title", with: @myfile.title
    click_on "Update Myfile"

    assert_text "Myfile was successfully updated"
    click_on "Back"
  end

  test "destroying a Myfile" do
    visit myfiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Myfile was successfully destroyed"
  end
end
