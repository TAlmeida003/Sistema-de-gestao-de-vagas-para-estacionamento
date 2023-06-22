/*MULTIPLEXADOR 8 X 4*/
module mux8_4(w0, w1, w2, w3, ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7, s);

    input ch0, ch2, ch4, ch6; //CONTEÚDO DA COLUNA 1;
    input ch1, ch3, ch5, ch7; // CONTEÚDO DA COLUNA 2;
    input s; //ENTRADA DE CONTROLE;
    output w0, w1, w2, w3; //ELEMENTOS SELECIONADOS;
   
   /* OBS.: O VALOR DAs CHAVES FORAM NEGADAS, JÁ QUE A MATRIZ DE ÁNODO(LÓGICA INVERTIDA)*/
    mux2_1 mux1(w0, (~ch0), (~ch1), s); // SELECIONAR LINHA 1;
    mux2_1 mux2(w1, (~ch2), (~ch3), s); // SELECIONAR LINHA 2;
    mux2_1 mux3(w2, (~ch4), (~ch5), s); // SELECIONAR LINHA 3;
    mux2_1 mux4(w3, (~ch6), (~ch7), s); // SELECIONAR LINHA 4;

endmodule