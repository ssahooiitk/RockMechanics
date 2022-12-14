
ClustNo = [165, 50952, 96568, 99406, 101435]; %Pore clusters
labelClusterFDs = labelClusterMat;
flag = 1
    
for count = 1:length(ClustNo)
    testmatrix = labelClusterFDs;
    for i = 1:1:512
        for j = 1:1:512
            for k = 1:1:512
                if testmatrix(i,j,k) == ClustNo(count)
                    testmatrix(i,j,k) = 0;
                end
            end
        end
    end
    
     for i = 1:1:512
        for j = 1:1:512
            for k = 1:1:512
                if testmatrix(i,j,k) ~= 0
                    testmatrix(i,j,k) = 1;
                end
            end
        end
     end
     
     
    flag = 2 
    A = abs(testmatrix-1); % Black->Pores-> 0  and  White->Grains-> 1   
    leni = length(A);
    S = leni;
    c = 1;

    %%%Calculating Factors%%%
    for n = 1:leni
        if rem(leni,n) == 0
            factr(c) = n ;
            c = c + 1;
        end
    end
    lenf = length(factr);

    for s = 1:1:lenf
        x(s) = factr(s); m = 0;
        r = factr(s)

        for i = 1:S/r:S
            for j = 1:S/r:S
                for k = 1:S/r:S
                    B = A(i:i + S/r - 1, j:j + S/r - 1, k:k + S/r - 1);
                    if sum(sum(sum(B))) > 0 && sum(sum(sum(B))) < ((S/r)^3) - 1
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
end

