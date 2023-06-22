//COMPLEMENTO DE 2
module sub(res, element);
//SUBTRATOR QUE SUBTRAI O NÚMERO DE CHAVES LIGADAS DO BINÁRIO 8(4'b1000)
    input [3:0] element;
    output [3:0] res;
     
    assign res = 4'b1001 + (~element);
     
endmodule