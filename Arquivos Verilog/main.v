module main(D1, D2, D3,  D4, a, b, c, d, e, f, g, dp, l0, l1, l2, l3,l4, l5, l6 ,c0, c1, ch, clk_internal);
   
    input [7:0] ch;                         // CHAVES QUE REPRESENTAM AS VAGAS DO ESTACIONAMENTO;
    input clk_internal;                     // PULSO DA ONDA QUADRÁTICA 50 Mhz NATIVA DA CPLD;
   
    output D1, D2, D3,  D4;                 // DÍGITOS DO DISPLAY DE 7 SEGMENTOS;
    output a, b, c, d, e, f, g, dp;         // SEGMENTOS DO DISPLAY DE 7 SEGMENTOS;
   
    output l0, l1, l2, l3, l4, l5, l6;      // LINHAS DA MATRIZ DE LED;
    output c0, c1;                          // COLUNAS DA MATRIZ DE LED;
   
    wire [3:0] num_ch_on;                   // NÚMERO DE VAGAS OCUPADAS;
    wire [3:0] num_ch_off;                  // NÚMERO DE VAGAS LIVRES;
    wire [17:0] clk_divided;


    divided_frequecy did_f(clk_internal, clk_divided);

    /*ADQUIRIR NÚMERO DE CHAVES EM ESTADO "ON"*/
    sum_ch sum(num_ch_on, ch); //CONTAR O NÚMERO DE CHAVES EM ESTADOS "ON", SOMANDO O NÍVEL LÓGICO DE CADA CHAVE;
   
   /*ADQUIRIR O NÚMERO DE CHAVES EM ESTADO OFF*/
   /*USO DE COMPLEMENTO DE DOIS*/
    sub complent(num_ch_off, num_ch_on); // SUBTRAIR DA QUANTIDADE MÁXIMA DE VAGAS (OITO) O NÚMERO DE VAGAS OCUPADAS;
 
  /*MULTIPLEXAÇÃO DE DISPLAY*/
  //OBS: O VALOR DO CLK É ENVIADO MAIOR QUE 190 hz, POIS DENTRO DO MÓDULO EXISTE MAIS UM CONTADOR, FORMANDO 190 hz;  
    mux_display Display(D1, D2, D3,  D4, a, b, c, d, e, f, g, dp, num_ch_off, num_ch_on, clk_divided[15]); // EXIBIR NO DISPLAY O NÚMEROS DE VAGAS LIVRES E OCULPADAS;
   
   /* MULTIPLEXAÇÃO DA MATRIZ DE LED*/
    matriz_led MatrizLed(l0, l1, l2, l3, l4, l5, l6, c0, c1, ch[0], ch[1], ch[2], ch[3], ch[4], ch[5], ch[6], ch[7], clk_divided[17]); //REPRESENTAR AS VAGAS OCULPADAS/LIVRES NA MATRIZ DE LED;
   
endmodule
