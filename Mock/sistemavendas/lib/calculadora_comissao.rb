class CalculadoraComissao
    def calcular_comissao(valor_venda)
        if(valor_venda <= 10000)
            valor_venda * 0.05
        else
            valor_venda * 0.06
        end
    end
end