module cont(
    input clk,
    output reg [1:0] cont  // CONTADOR PARA LIGAR UM DÍGITO POR VEZ;
);
       
    initial begin
        cont = 2'b00;
    end

   /* CONTADOR DE 2 BIT'S*/
   // OBS: ESSE CONTADOR FAZ COM QUE A FRQUENCIA DO DISPLAY SEJA DE 190 hz;
    always @ (posedge clk)begin // DETECTOR DE BORDA DE SUBIDA, PARA ATIVAR O CONTADOR;
        cont = cont + 1'b1;     // PEGAR O VALOR GUARDADO NOS FLIP-FLOP E SOMAR COM UM BIT;
    end

endmodule