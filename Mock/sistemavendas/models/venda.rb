class Venda
    attr_reader :venda_id, :valor, :mes, :ano
    
    def initialize(venda_id, valor, mes, ano)
        @venda_id = venda_id
        @valor = valor
        @ano = ano
        @mes = mes
    end
end