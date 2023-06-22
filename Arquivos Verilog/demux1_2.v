
/*DEMULTIPLEXADOR 1 X 2*/
module demux1_2(y0, y1, w, s);
    input w, s;
    output y0, y1;
   
    assign y0 = w & (~s); // LIBERAR O VALOR LÓGICO UM PARA A SAÍDA "Y0", CASO "S" SEJA IGUAL A ZERO E "W" IGUAL A 1;
    assign y1 = w & s; // LIBERAR O VALOR LÓGICo UM PARA A SAÍDA "Y1", CASO "S" SEJA IGUAL A UM E "W" IGUAL A 1
   
endmodule