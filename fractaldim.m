function fd = fractaldim(img,n)
     ch = n;
     fd = 0;
    switch(ch)
        case 1    
            A = img; % Black->Pores-> 0  and  White->Grains-> 1   
            leni = length(img);
            S = leni; %Total Size
            c = 1;
            %%%Calculating Factors%%%
            for n = 1:leni
                if rem(leni,n) == 0
                    factr(c) = n ;
                    c = c + 1;
                end
            end
            lenf = length(factr);
            %3D Box Counting Fractal Dimension Calculation
            for s = 1:1:lenf
                x(s) = factr(s); m = 0; %Scaling factor
                r = factr(s);

                for i = 1:S/r:S
                    for j = 1:S/r:S
                            B = A(i:i + S/r - 1, j:j + S/r - 1);
                            if sum(sum(B)) > 0
                                m = m+1;
                            end
                    end
                end
                N(s) = m; %Number of boxes count
            end
            p=polyfit(log(x(2:lenf)),log(N(2:lenf)),1); %Slope of line
            fd = p(1);

        case 2
        A = img; % Black->Pores-> 0  and  White->Grains-> 1   
            leni = length(img);
            S = leni; %Total Size
            c = 1;

            %%%Calculating Factors%%%
            for n = 1:leni
                if rem(leni,n) == 0
                    factr(c) = n ;
                    c = c + 1;
                end
            end
            lenf = length(factr);

            %3D Box Counting Fractal Dimension Calculation
            for s = 1:1:lenf
                x(s) = factr(s); m = 0; %Scaling factor
                r = factr(s);

                for i = 1:S/r:S
                    for j = 1:S/r:S
                            B = A(i:i + S/r - 1, j:j + S/r - 1);
                            if prod(prod(B)) == 0
                                m = m+1;
                            end
                    end
                end
                N(s) = m; %Number of boxes count
            end
            p=polyfit(log(x(2:lenf)),log(N(2:lenf)),1); %Slope of line
            fd = p(1);
    end
end



    