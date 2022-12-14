function expected_ec = eulercharact(img,n)
    ch = n; expected_ec = 0;
    switch(ch)
        case 1
            expected_ec = bweuler(img,8);
        case 2
            img = abs(img - 1);
            expected_ec = bweuler(img,8);
    end
end
