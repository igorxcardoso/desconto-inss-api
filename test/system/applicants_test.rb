require "application_system_test_case"

class ApplicantsTest < ApplicationSystemTestCase
  setup do
    @applicant = applicants(:one)
  end

  test "visiting the index" do
    visit applicants_url
    assert_selector "h1", text: "Applicants"
  end

  test "should create applicant" do
    visit applicants_url
    click_on "New applicant"

    fill_in "Birth date", with: @applicant.birth_date
    fill_in "City", with: @applicant.city
    fill_in "Cpf", with: @applicant.cpf
    fill_in "Name", with: @applicant.name
    fill_in "Neighborhood", with: @applicant.neighborhood
    fill_in "Number", with: @applicant.number
    fill_in "Personal phone", with: @applicant.personal_phone
    fill_in "Reference phone", with: @applicant.reference_phone
    fill_in "Salary", with: @applicant.salary
    fill_in "State", with: @applicant.state
    fill_in "Street", with: @applicant.street
    fill_in "Zip code", with: @applicant.zip_code
    click_on "Create Applicant"

    assert_text "Applicant was successfully created"
    click_on "Back"
  end

  test "should update Applicant" do
    visit applicant_url(@applicant)
    click_on "Edit this applicant", match: :first

    fill_in "Birth date", with: @applicant.birth_date
    fill_in "City", with: @applicant.city
    fill_in "Cpf", with: @applicant.cpf
    fill_in "Name", with: @applicant.name
    fill_in "Neighborhood", with: @applicant.neighborhood
    fill_in "Number", with: @applicant.number
    fill_in "Personal phone", with: @applicant.personal_phone
    fill_in "Reference phone", with: @applicant.reference_phone
    fill_in "Salary", with: @applicant.salary
    fill_in "State", with: @applicant.state
    fill_in "Street", with: @applicant.street
    fill_in "Zip code", with: @applicant.zip_code
    click_on "Update Applicant"

    assert_text "Applicant was successfully updated"
    click_on "Back"
  end

  test "should destroy Applicant" do
    visit applicant_url(@applicant)
    click_on "Destroy this applicant", match: :first

    assert_text "Applicant was successfully destroyed"
  end
end
