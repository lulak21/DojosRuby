require "venda_repository"
require "calculadora_comissao"

class CalculadoraRoyalties
    def initialize(repo = VendaRepository.new)
        @repo = repo
    end
    
    def calcular_royalties(mes, ano)
        faturamento = 0
        comissoes = 0
        
        calculadora_comissao = CalculadoraComissao.new
        vendas = @repo.obtervendaspormeseano(mes,ano)

        unless vendas.nil?
            vendas.each do |venda|
                faturamento += venda.valor
                comissoes += calculadora_comissao.calcular_comissao(venda.valor)
            end
        end
        
        (faturamento - comissoes) * 0.2
    end
end