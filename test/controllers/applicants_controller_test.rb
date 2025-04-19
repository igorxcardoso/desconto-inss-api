require "test_helper"

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = applicants(:one)
  end

  test "should get index" do
    get applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_applicant_url
    assert_response :success
  end

  test "should create applicant" do
    assert_difference("Applicant.count") do
      post applicants_url, params: { applicant: { birth_date: @applicant.birth_date, city: @applicant.city, cpf: @applicant.cpf, name: @applicant.name, neighborhood: @applicant.neighborhood, number: @applicant.number, personal_phone: @applicant.personal_phone, reference_phone: @applicant.reference_phone, salary: @applicant.salary, state: @applicant.state, street: @applicant.street, zip_code: @applicant.zip_code } }
    end

    assert_redirected_to applicant_url(Applicant.last)
  end

  test "should show applicant" do
    get applicant_url(@applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_applicant_url(@applicant)
    assert_response :success
  end

  test "should update applicant" do
    patch applicant_url(@applicant), params: { applicant: { birth_date: @applicant.birth_date, city: @applicant.city, cpf: @applicant.cpf, name: @applicant.name, neighborhood: @applicant.neighborhood, number: @applicant.number, personal_phone: @applicant.personal_phone, reference_phone: @applicant.reference_phone, salary: @applicant.salary, state: @applicant.state, street: @applicant.street, zip_code: @applicant.zip_code } }
    assert_redirected_to applicant_url(@applicant)
  end

  test "should destroy applicant" do
    assert_difference("Applicant.count", -1) do
      delete applicant_url(@applicant)
    end

    assert_redirected_to applicants_url
  end
end
