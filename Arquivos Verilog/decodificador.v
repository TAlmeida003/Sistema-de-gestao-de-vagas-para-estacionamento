/*DECODIFICADOR DE 7 SEGMENTOS*/

module decodificador(a, b, c, d, e, f, g, A, B, C, D);
//CONVERTE UMA ENTRADA DE 4 BIT'S PARA UMA ENTRADA DE DISPLAY DE 7 SEGMENTOS;
    input A, B, C, D;
    output a,b,c,d,e,f,g; // SEGMENTOS DO DISPLAY;
   
    wire B_NOTC_NOTD, AC, AD, BCD; // FIOS AUXILIARES;
   
    assign B_NOTC_NOTD = B & (~C) & (~D);
    assign AC = A & C;
    assign AD = A & D;
    assign BCD = B & C & D;
   
    assign a = B_NOTC_NOTD | (~B) & (~C) & D | AC;   // DEFINE A;
    assign b = B & (~C) & D | B & C & (~D) | AD | AC; // DEFINE B;
    assign c = (~A) & (~B) & C & (~D) | AD; // DEFINE C;
    assign d = (~A) & (~B) & (~C) & D | B_NOTC_NOTD | BCD; // DEFINE D;
    assign e = B & (~C) | (~A) & D; // DEFINE E;
    assign f = (~A) & (~B) & D | C & D | (~B) & C;     // DEFINE F;
    assign g = BCD | (~A) & (~B) & (~C) | AD;           // DEFINE G;
   
endmodule