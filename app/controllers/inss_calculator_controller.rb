class InssCalculatorController < ApplicationController
  # GET /inss_calculator
  def create
    salario = params[:salary].to_f
    render json: { desconto: InssCalculator.new(salario).calcular }
  end
end
