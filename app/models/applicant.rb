class Applicant < ApplicationRecord
  validates :name, :cpf, :birth_date, presence: true
  validates :salary, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :inss_discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
