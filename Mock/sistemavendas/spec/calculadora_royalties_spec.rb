require "calculadora_royalties"
require "./models/venda"

describe CalculadoraRoyalties do
    describe ".calcular" do
        
        before do
            @repo = double
            @calculadora = CalculadoraRoyalties.new(@repo)
        end

        context "dado que não houveram vendas em janeiro de 2010" do
            it "retorna 0.00" do
                mes = 1
                ano = 2010
                valor_royalties_esperado = 0.00
                allow(@repo).to receive(:obtervendaspormeseano).with(mes, ano).and_return([])
                
                valor_royalties_calculado = @calculadora.calcular_royalties(mes,ano)

                expect(valor_royalties_calculado).to eql(valor_royalties_esperado)
            end
        end

        context "dado que houve uma venda de 100 reais em fevereiro de 2010" do
            it "retorna 19.00" do
                mes = 2
                ano = 2010
                valor_venda = 100
                valor_royalties_esperado = 19.00
                vendas = [Venda.new(1, valor_venda, mes, ano)]
                allow(@repo).to receive(:obtervendaspormeseano).with(mes, ano).and_return(vendas)
                
                valor_royalties_calculado = @calculadora.calcular_royalties(mes,ano)

                expect(valor_royalties_calculado).to eql(valor_royalties_esperado)    
            end
        end

        context "dado que houve uma venda de 200 reais em março de 2010" do
            it "retorna 38.00" do
                mes = 3
                ano = 2010
                valor_venda = 200
                valor_royalties_esperado = 38.00
                vendas = [Venda.new(1, valor_venda, mes, ano)]
                allow(@repo).to receive(:obtervendaspormeseano).with(mes, ano).and_return(vendas)
                
                valor_royalties_calculado = @calculadora.calcular_royalties(mes,ano)

                expect(valor_royalties_calculado).to eql(valor_royalties_esperado)
            end
        end

        context "dado que houveram duas vendas de 200 reais em abril de 2010" do
            it "retorna 76.00" do
                mes = 4
                ano = 2010
                valor_de_cada_venda = 200
                valor_royalties_esperado = 76.00
                
                vendas = [  Venda.new(1, valor_de_cada_venda, mes, ano), 
                            Venda.new(2, valor_de_cada_venda, mes, ano)]

                allow(@repo).to receive(:obtervendaspormeseano).with(mes, ano).and_return(vendas)
                
                valor_royalties_calculado = @calculadora.calcular_royalties(mes,ano)

                expect(valor_royalties_calculado).to eql(valor_royalties_esperado)
            end
        end

        context "dado que houveram duas vendas de 200 reais e uma de 150000 em abril de 2010" do
            it "retorna 76.00" do
                mes = 4
                ano = 2010

                valor_venda_um = 200
                valor_venda_dois = 200
                valor_venda_tres = 150000

                valor_royalties_esperado = 28276.00
                
                vendas = [  Venda.new(1, valor_venda_um, mes, ano), 
                            Venda.new(2, valor_venda_dois, mes, ano) ,
                            Venda.new(2, valor_venda_tres, mes, ano)]

                allow(@repo).to receive(:obtervendaspormeseano).with(mes, ano).and_return(vendas)
                
                valor_royalties_calculado = @calculadora.calcular_royalties(mes,ano)

                expect(valor_royalties_calculado).to eql(valor_royalties_esperado)
            end
        end
    end
end