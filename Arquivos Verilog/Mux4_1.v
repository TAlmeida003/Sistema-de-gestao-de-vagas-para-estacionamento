/*MULTIPLEXADOR 4 POR 1 */
module Mux4_1(W, L0, L1, L2, L3, cont);
// SELECIONAR UMA DAS 4 ENTRADAS EM VIRTUDE DOS DOIS BIT'S DA ENTRADA DE CONTROLE "CONT";
   
    input L0, L1, L2, L3;
    input [1:0] cont;
    output W;

    wire and1, and2, and3, and4; // FIOS AUXILIARES;
 
    assign and1 = L0 & (~cont[0]) & (~cont[1]); // MANDAR O VALOR LÓGICO DE LO;
    assign and2 = L1 & cont[0] & (~cont[1]); // MANDAR O VALOR LÓGICO DE L1;
    assign and3 = L2 & (~cont[0]) & cont[1]; // MANDAR O VALOR LÓGICO DE L2;
    assign and4 = L3 & cont[0] & cont[1]; // MANDAR O VALOR LÓGICO DE L3;
   
    assign W = and1 | and2 | and3 | and4;
   
endmodule