require 'rails_helper'

RSpec.describe InssCalculatorController, type: :controller do
  describe "POST #create" do
    context "quando o salário é válido" do
      it "retorna o desconto calculado" do
        salario = 3000.0
        # Simula a requisição POST com o parâmetro salary
        post :create, params: { salary: salario }

        # Verifica se a resposta tem o status correto
        expect(response).to have_http_status(:success)

        # Verifica se a resposta é um JSON contendo o desconto
        json_response = JSON.parse(response.body)
        # Aqui você ajusta o valor esperado para o desconto de acordo com a lógica do InssCalculator
        expected_desconto = InssCalculator.new(salario).calcular
        expect(json_response["desconto"]).to eq(expected_desconto)
      end
    end

    context "quando o salário é inválido" do
      it "retorna o desconto como 0 para valores não numéricos" do
        salario = "abc"
        post :create, params: { salary: salario }

        # Verifica se a resposta tem o status correto (pode ser :unprocessable_entity ou :bad_request)
        expect(response).to have_http_status(:success)

        # Verifica se o desconto retornado é 0 para valores inválidos
        json_response = JSON.parse(response.body)
        expect(json_response["desconto"]).to eq(0)
      end
    end
  end
end
