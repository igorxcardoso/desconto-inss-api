class InssCalculator
  def initialize(salario)
    @salario = salario.to_f
  end

  def calcular
    desconto = 0.0
    teto_anterior = 0.0

    [
      { limite: 1045.00, aliquota: 0.075 },
      { limite: 2089.60, aliquota: 0.09 },
      { limite: 3134.40, aliquota: 0.12 },
      { limite: 6101.06, aliquota: 0.14 }
    ].each do |faixa|
      if @salario > faixa[:limite]
        desconto += (faixa[:limite] - teto_anterior) * faixa[:aliquota]
        teto_anterior = faixa[:limite]
      else
        desconto += (@salario - teto_anterior) * faixa[:aliquota]
        break
      end
    end

    desconto.round(2)
  end
end
