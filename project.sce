clc;
disp('Enter the message sequence: ');
for i = 1:7
    msg(i)=input('');
end
C1 = [msg(1), msg(2), msg(3), msg(4), msg(5), msg(6), msg(7)];
C1
disp('Enter the errored message sequence: ');
for i = 1:7
    err(i)=input('');
end
C2 = [err(1), err(2), err(3), err(4), err(5), err(6), err(7)];
C2

D = poly(0, 'D');  
p = input("Enter a generator polynomial in variable D: ", "string");
G = evstr(p); 
disp(G, 'G(D) = '); 

C1 = poly([C1], 'D', 'c')
C2 = poly([C2], 'D', 'c')

[r1 , q1] = pdiv(C1, G);
S1 = coeff(r1) ;
S1 = modulo(S1, 2);
 
disp(r1 , 'Remainder in polynomial form : ' );
disp(S1 , 'Syndrome bits for error-free codeword are : ');
[r2, q2] = pdiv(C2, G);
S2 = coeff(r2);
S2 = modulo(S2, 2);
disp(r2 , 'Remainder in polynomial form for errored codeword: ' );
disp(S2 , 'Syndrome bits for errored codeword are: ');
