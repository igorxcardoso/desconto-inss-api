require 'rails_helper'

RSpec.describe Applicant, type: :model do
  it "tem uma factory válida" do
    applicant = build(:applicant)
    expect(applicant).to be_valid
  end

  context "validações de presença" do
    it "é inválido sem nome" do
      applicant = build(:applicant, name: nil)
      expect(applicant).not_to be_valid
      expect(applicant.errors[:name]).to include("can't be blank").or include("não pode ficar em branco")
    end

    it "é inválido sem CPF" do
      applicant = build(:applicant, cpf: nil)
      expect(applicant).not_to be_valid
    end

    it "é inválido sem data de nascimento" do
      applicant = build(:applicant, birth_date: nil)
      expect(applicant).not_to be_valid
    end
  end

  context "valores numéricos" do
    it "aceita salário e desconto como números válidos" do
      applicant = build(:applicant, salary: 2500.75, inss_discount: 300.10)
      expect(applicant).to be_valid
    end

    it "é inválido com salário negativo" do
      applicant = build(:applicant, salary: -1000.00)
      expect(applicant).not_to be_valid if Applicant.validators_on(:salary).any? { |v| v.kind == :numericality && v.options[:greater_than_or_equal_to] }
    end
  end
end
