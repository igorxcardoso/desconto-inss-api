require 'rails_helper'

RSpec.describe "InssCalculator", type: :request do
  describe "POST /inss_calculator" do
    it "retorna o desconto calculado para um salário válido" do
      salario = 3000.00
      desconto_esperado = InssCalculator.new(salario).calcular

      post "/inss_calculator", params: { salary: salario }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        "desconto" => desconto_esperado
      })
    end

    it "retorna 0.0 se o salário não for fornecido" do
      post "/inss_calculator"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({
        "desconto" => InssCalculator.new(0.0).calcular
      })
    end
  end
end
