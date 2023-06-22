
/*ASSOCIAÇÃO DE MULTIPLEXADORES*/
module Mux16_4(S, free, busy, cont);
// RECEBER UM CONJUNTO DE 16 BIT'S E SELECIONAR 4 BIT'S A PARTIR DO DOIS DA ENTRADA DE CONTROLE "CONT";
   
    input [3:0] free; // VAGAS LIVRES
    input [3:0] busy; // VAGAS OCULPADAS
    input [1:0] cont; // ESTADO ATUAL DO CONTADOR;
   
    output [3:0] S;
   
    Mux4_1  kk(S[3], free[3], 1'b1, busy[3], 1'b1, cont); // BIT MSB;
    Mux4_1 g(S[2], free[2], 1'b0, busy[2], 1'b0, cont);   // BIT 3;
    Mux4_1 b(S[1], free[1], 1'b0, busy[1], 1'b1, cont);   // BIT 2;
    Mux4_1 ui(S[0], free[0], 1'b1, busy[0], 1'b0, cont);  // BIT LSB;
   
endmodule