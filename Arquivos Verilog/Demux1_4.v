
/*DEMULTIPLEXADOR 4 POR 1*/
module Demux1_4(L0, L1, L2, L3, W, cont);
// RECEBER UM BIT E A PARTIR DA ENTRADA DE CONTROLE "cont", MANDAR UM UM VALOR LÓGICO ALTO PARA UMA DAS 4 ENTRADAS;
    input W;
    input [1:0] cont; // ESTADO ATUAL DO CONTADOR;
    
    output L0, L1, L2, L3; // DÍGITOS DO DISPLAY;
   
    assign L0 = ~((W) & (~cont[1]) & (~cont[0])); //LIGAR  O DÍGITO 1, SE 'CONT' FOR IGUAL 00;
    assign L1 = ~((W) & cont[0] & (~cont[1])); //LIGAR  O DÍGITO 2, SE 'CONT' FOR IGUAL 01;
    assign L2 = ~((W) & cont[1] & (~cont[0])); //LIGAR  O DÍGITO 3, SE 'CONT' FOR IGUAL 10;
    assign L3 = ~((W) & cont[1] & cont[0]);    //LIGAR  O DÍGITO 4, SE 'CONT' FOR IGUAL 11;
     
endmodule