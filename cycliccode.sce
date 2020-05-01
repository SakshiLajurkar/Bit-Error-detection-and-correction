clc;
//Taking the generator polynomial as input
D=poly(0,'D');
disp('Enter the generator polynomial in variable D:');
p=input("",'string');
Gen_polynomial=evstr(p);
disp(Gen_polynomial, 'G(D)=');

//Taking code word length and length of message sequence as input
disp('Enter the length of the message sequence:');
k=input("");disp(k, 'k=');
disp('Enter the length of the codeword:');
n=input("");
disp(n, 'n=');

//Taking the message polynomial as input
disp('Enter the message polynomial in variable D:');
s=input("",'string');
message_poly=evstr(s);
disp(message_poly, 'm(D)=');
multiplier=D^(n-k);
y=multiplier*message_poly;
disp(y, 'Multiplied part:');

//Obtaining the remainder
[remainder,quotient]=pdiv(y,Gen_polynomial);
disp(remainder, 'b(D)');
codeword_poly=remainder+y;
disp(codeword_poly, 'The codeword polynomial x(D):');
