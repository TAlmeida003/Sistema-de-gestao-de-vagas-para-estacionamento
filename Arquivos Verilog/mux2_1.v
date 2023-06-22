
/*MULTIPLEXADOR 2X1*/
module mux2_1(y, w0, w1, s);

    input w0, w1;
    input s;
   
    output y;
   
    assign y = w0 & (~s) | w1 & s;
   
endmodule