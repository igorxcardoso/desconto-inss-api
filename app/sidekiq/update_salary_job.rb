class UpdateSalaryJob
  include Sidekiq::Job

  def perform(applicant_id, new_salary)
    applicant = Applicant.find_by(id: applicant_id)
    return unless applicant

    if applicant.update(salary: new_salary, inss_discount: InssCalculator.new(new_salary).calcular)
      Rails.logger.info "Updated applicant #{applicant.id} with new salary: #{new_salary} and INSS discount: #{applicant.inss_discount}"
    else
      Rails.logger.error "Failed to update applicant #{applicant.id}: #{applicant.errors.full_messages.join(", ")}"
    end
  end
end
