disp("Enter block length (n):");
n = input("");
k = 4;

//Number of parity bits 
m = n-k;
I = eye(k,k); 

//coefficient matrix
P = zeros(k,m);
disp("Enter elements of coefficient matrix P");
for i=1:k
    for j=1:m
        P(i,j)=input("");
    end
end
disp(P, "Coefficient matrix P")

// generator matrix 
G = [P I]; 
disp(G, "Generator matrix G")

//P transpose
PT = P';

// parity check matrix
H = [eye(k-1,k-1) PT];
disp(H, "Parity check matrix H")

//message bits from 0000 to 1111 
m = [0,0,0,0;
0,0,0,1;
0,0,1,0;
0,0,1,1;
0,1,0,0;
0,1,0,1;
0,1,1,0;
0,1,1,1;
1,0,0,0;
1,0,0,1;
1,0,1,0;
1,0,1,1;
1,1,0,0;
1,1,0,1;
1,1,1,0;
1,1,1,1];
//

//codeword of Hamming codes
C = m*G;
C = modulo(C,2); 
disp(C, "Code words of Hamming code")

//received code word y
y = zeros(1,n);
disp("Enter the received codeword")
for h = 1:n
    y(1,h)=input("");
end
disp(y, "Received code word");

//H  transpose
HT = H';

//syndrome calculation
S = y*HT;
S = modulo(S,2); 
disp(S, "Syndrome of the received message");

//      ERROR CORRECTION FOR (7, 4) HAMMING CODE       //

if (n==7) & (k==4) then
    
//syndrome patterns for (7, 4) hamming code
syndrome = [1,0,0;
0,1,0;
0,0,1;
1,1,0;
0,1,1;
1,1,1;
1,0,1];

//corressponding error patterns
error_pattern = eye(7,7);

if S==[0,0,0] then
    disp("Your message is error free")
else
    disp("Your message has an error")
end

ep= zeros(1,7);
for v = 1:7
    if S == syndrome(v,:)
        ep=error_pattern(v,:);
    end
end

//corrected message
y_corrected = y + ep;
y_corrected = modulo(y_corrected, 2);
disp(y, "Received code word");
disp(S, "Syndrome of the received message");
disp(ep,"Error pattern for syndrome is")
disp(y_corrected, "The corrected code word is")

else
    disp("You do not have (7,4) hamming code")
end

