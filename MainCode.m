clear;clc;
n = input("1: Grain/Matrix ||  2: Pores");
counter = 1;
for k = 1:10:900
    k
    img1 = imread(sprintf("FIG%g.tif",k))  ;
    %imgray = rgb2gray(img1);
    img = imbinarize(img1,0.53);
    
    [bn0,bn1,bn2,computed_ec] = bettinmbrs(img,n);
    allsampb0(counter) = bn0;
    allsampb1(counter) = bn1;
    allsampb2(counter) = bn2;
    allsampcomputed_ec(counter) = computed_ec;
    
    fd = fractaldim(img,n);
    allsampfd(counter) = fd;
    
    expected_ec = eulercharact(img,n);
    allsampexpected_ec(counter) = expected_ec;
    counter = counter + 1;
end

    
    