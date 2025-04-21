class UpdateSalaryJob
  include Sidekiq::Job

  def perform(applicant_id, new_salary)
    applicant = Applicant.find_by(id: applicant_id)
    return unless applicant

    applicant.update(
      salary: new_salary,
      inss_discount: 0
    )
  end
end
