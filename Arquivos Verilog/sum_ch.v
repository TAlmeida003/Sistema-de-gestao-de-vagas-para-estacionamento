//SOMADOR
module sum_ch(num, element);
//SOMAR OS PINOS EM NÍVEL LÓGICO ALTO//
    input [7:0] element;
    output [3:0]num;
   
    assign num = (element[0] + element[1] + element[2] + element[3] + element[4] + element[5] + element[6] + element[7]);

endmodule