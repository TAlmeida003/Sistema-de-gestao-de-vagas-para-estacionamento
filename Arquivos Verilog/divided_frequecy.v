module divided_frequecy (
    input clk_internal,
    output reg [17:0] clk_divided
);

   
    /* RECEBER UMA ONDA QUADRÁTICA DE 50 Mhz E CONVERTER PARA APROXIMADAMENTE 190 hz*/    
    initial begin
        clk_divided = 18'd0;            // INICIAR CONTADOR;
    end
   
    always @ (posedge clk_internal) begin   // DETECTOR DE BORDA DE SUBIDA;
   
        clk_divided <= clk_divided + 1'b1;  // VALOR ATUAL ARMAZENADO NO FLIP-FLOP "D" MAIS UM BIT;
       
        if (clk_divided == 18'h3FFFF) begin        // CONTROLAR OVERFLOW;
            clk_divided <= 18'h0;                  // RESETAR PARA O VALOR INICIAL;
        end
    end  
    
endmodule