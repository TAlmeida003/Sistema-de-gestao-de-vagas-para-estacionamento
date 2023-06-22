/*MULTIPLEXAÇÃO DE DISPLAY*/
module mux_display(D1, D2, D3,  D4, a, b, c, d, e, f, g,dp, free, busy, clk);

    //OBS.: O CONJUNTO DE DISPLAYS DE SEGMENTOS SÃO DE ÂNODOS;
   
    input [3:0] free; // CONJUNTO DE BIT's QUE REPRESENTAM AS VAGAS LIVRES;
    input [3:0] busy;  // CONJUNTO DE BIT's QUE REPRESENTAM AS VAGAS OCULPADAS;
    input clk;
   
    output D1, D2, D3, D4;   // DÍGITOS DO DISPLAY
    output a, b, c, d, e, f, g, dp; // SEGMENTOS DO DISPLAY DE 7 SEGMENTOS
   
    wire [3:0] ent;     // ENTRADAS DO DECODIFICADOR DE 7 SEGMENTOS
    
 

    assign dp = 1'b1; // DESLIGAR O PONTO;
   
   /*MULTIPLEXAR O CONTEUDO A SER EXIBIDO*/
    Mux16_4 mux16_41(ent, free, busy, cont); // TROCAR O CONTEÚDO HÁ SER EXIBIDO, REVERTENDO ENTRE: NÚMERO DE VAGAS LIVRES, REPRESENTAÇÃO DE UM "L", NÚMERO DE VAGAS OCUPADAS E REPRESENTAÇÃO DE UM "o";
   
   /*DECODIFICADOR DE 7 SEGMENTOS*/
    decodificador decod(a, b, c, d, e, f, g, ent[3], ent[2], ent[1], ent[0]); // CONVERTER UM CONJUNTO DE BIT'S A SER REPRESENTADO NO DISPLAY DE 7 SEGMENTOS;
   
   /*DEMULTIPLEXADOR 4 X 1*/
    Demux1_4 demux2(D1, D2, D3, D4, 1'b1, cont); // LIGAR UM DÍGITO DO DISPLAY, APARTIR DO VALOR DO CONTADOR;

endmodule
