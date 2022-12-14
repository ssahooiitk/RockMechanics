%clear;clc;
%load im ;
A = im ; % Black->Pores-> 0  and  White->Grains-> 1   
leni = length(A)
S = leni
c = 1;

%%%Calculating Factors%%%
for n = 1:leni
    if rem(leni,n) == 0
        factr(c) = n ;
        c = c + 1;
    end
end
lenf = length(factr)

%3D Box Counting Fractal Dimension Calculation
for s = 1:1:lenf
    x(s) = factr(s); m = 0;
    r = factr(s) 
    
    for i = 1:S/r:S
        for j = 1:S/r:S
            for k = 1:S/r:S
                B = A(i:i + S/r - 1, j:j + S/r - 1, k:k + S/r - 1);
                if sum(sum(sum(B))) > 0 && sum(sum(sum(B))) < ((S/r)^3)
                    m = m+1;
                end
            end
        end
    end
    N(s) = m;
end
p=polyfit(log(x(2:26)),log(N(2:26)),1)
fractal_dm=p(1)
N, x
    
    
    