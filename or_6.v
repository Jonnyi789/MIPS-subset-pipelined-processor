module or_6 (a,b,c,d,e,f, z);
    input a,b,c,d,e,f;
    output z;
    wire ab, cd, ef, abcd;
    
    or_gate first(.x(a), .y(b), .z(ab));
    or_gate second(.x(c), .y(d), .z(cd));
    or_gate third(.x(e), .y(f), .z(ef));
    or_gate fourth(.x(ab), .y(cd), .z(abcd));
    or_gate fifth(.x(abcd), .y(ef), .z(z));
endmodule
