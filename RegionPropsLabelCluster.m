clear;clc;
load im.mat
%InverseIm = abs(im - 1); USe when calculating pore clusters
InverseIm = im ; %Use when calculating grain clusters
[labelClusterMat,noClust] = bwlabeln(InverseIm,26);
R = regionprops3(labelClusterMat); % labelClusterMat contains the segmented clusters
RMatrix = table2array(R);
Vol = RMatrix(:,1);
VolSort = sort(Vol); %Ascending Sort
FiveLargeCluster = VolSort(end-4:end); % Largest Clusters
FiveLargeCluster

for x = 1:1:length(Vol)
for xx = 1:1:length(FiveLargeCluster)
if Vol(x) == FiveLargeCluster(xx)
x % IndicesCluster
end
end
end

flag = 1;
IndicesClusters = [3, 11898, 19442, 30241, 51725];
for count1 = 1:length(IndicesClusters)
    IndicesClusters(count1)
    thisRegion = ismember(labelClusterMat,IndicesClusters(count1));
    A = thisRegion; % thisRegion will contain extracted cluster, and rest will be 0s
    leni = length(A);
    S = leni;
    c = 1;
    flag = flag + 1
%%%Calculating Factors%%%
    for n = 1:leni
        if rem(leni,n) == 0
            factr(c) = n ;
            c = c + 1;
        end
    end
    lenf = length(factr);
    
    for x = 1:1:S
        for y = 1:1:S
            for z = 1:1:S
                if A(x,y,z) == IndicesClusters(count1)
                    A(x,y,z) = 1;
                end
            end
        end
    end
    flag = flag + 1
%3D Box Counting Fractal Dimension Calculation
    %A = abs(A-1);  comment when calculating for grains
    for s = 1:1:lenf
        x(s) = factr(s); m = 0;
        r = factr(s)

        for i = 1:S/r:S
            for j = 1:S/r:S
                for k = 1:S/r:S
                    B = A(i:i + S/r - 1, j:j + S/r - 1, k:k + S/r - 1);
                    if sum(sum(sum(B))) > 0
                        m = m+1;
                    end
                end
            end
        end
        N(s) = m;
    end

    p=polyfit(log(x(2:27)),log(N(2:27)),1)
    fractal_dm=p(1)
    N, x
end