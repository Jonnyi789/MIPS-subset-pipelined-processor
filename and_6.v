module and_6 (a,b,c,d,e,f, z);
    input a,b,c,d,e,f;
    output z;
    wire ab, cd, ef, abcd;
    
    and_gate first(.x(a), .y(b), .z(ab));
    and_gate second(.x(c), .y(d), .z(cd));
    and_gate third(.x(e), .y(f), .z(ef));
    and_gate fourth(.x(ab), .y(cd), .z(abcd));
    and_gate fifth(.x(abcd), .y(ef), .z(z));
endmodule
