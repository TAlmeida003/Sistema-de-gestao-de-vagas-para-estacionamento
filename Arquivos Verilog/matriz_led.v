/*MULTIPLEXAÇÃO DA MATRIZ DE LED*/
module matriz_led(l0, l1, l2, l3, l4, l5, l6, c0, c1, ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7, clk);
/*OBS.: PARA ACENDER OS ELEMENTOS DA METRIZ DE LED É NECESSÁRIO QUE A COLUNA TENHA VALOR LÓGICO
UM E A LINHA TENHA VALOR LÓGICO ZERO*/

    input ch0, ch2, ch4, ch6;           // CHAVES QUE REPRESENTAM A COLUNA 1;
   
    input ch1, ch3, ch5, ch7;           // CHAVES QUE REPRESENTAM A COLUNA 2;
   
    input clk;                          // CLOCK PARA REVESAR A LIGAÇÃO DE CADA COLUNA;
   
    output l0, l1, l2, l3, l4, l5, l6;  // LINHAS DA MATRIZ DE LED;
    output c0, c1;                      // COLUNAS DA MATRIZ DE LED;
   
   /*DESLIGAR AS LINHAS QUE NÃO SERAM USADAS*/
    assign l4 = 1'b1;
    assign l5 = 1'b1;
    assign l6 = 1'b1;
   
    /*SELECIONAR COLUNA HÁ ENTRAR EM ESTADO "ON"*/
    // LIGAR UMA DAS DUAS COLUNAS DA MATRIZ DE LED;
    demux1_2 demux(c0, c1, 1'b1, clk); 
   
    /*MULTIPLEXAR O CONTEÚDO DAS LINHAS*/
    // MUDAR AS LINHAS PARA O CONTEÚDO DA RESPECTIVA COLUNA QUE SE ENCONTRA EM ESTADO "ON";
    mux8_4 mux8_41(l0, l1, l2, l3, ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7, clk); 
   
endmodule
