%=========================================================================
% Syntax: [f_output]= hist_eq(f, n)
% Description: The fucntion above performs a histogram equalization
	% operation on a given input image f(base image).  
% Input:
        %f - a uint8 image
        %n - number of bits per pixel (in this case 8, as defined below)
% Output: 
        %f_output - Output table with Gray values, corresponding pdf & cdf calculations (cdf values represented on probability scale from 0-1), and output gray
%                   values    
% Name: Brendan Casey
% Lab: Assignment 4
% Quesiton Number: 2,a) and b)
% Date: 11/20/2018
%=========================================================================


%% Command Line:

    %f= imread('naivasha_bw_f.jpg')
    
    
function f_output = hist_eq(f, n)

%% Determine histogram of f
[C,T] = imhist(f);  % [count,binLocations]= imhist([input image])

%% Build an empty table of six columns (where row size = T, and six columns)
f_output = zeros((size(T, 1)), 6);
n = max(T)

% Determine title of each column
array2table(f_output, 'VariableNames', {'Grey_Level_IN', 'Frequency', 'PDF', 'CDF', 'CDF_n', 'Grey_Level_OUT' })
% Column 1 = The input gray values (I.E. "binLocations")
f_output(:,1) = T(:,1)

% Column 2 = Frequency (I.E. "count")
f_output(:,2) = C


%% Column 3 = Normalize the histogram (I.E. calculate PDF)
f_output(:,3) = C./sum(C);

%% Column 4 = cumulative sum over vector C (I.E. calculate the CDF)
f_output(:,4) = cumsum((f_output(:,3)),1);

%% Column 5 = (cdf*n) (where n=256, I.E. 0-255, I.E. max value = 255)
f_output(:,5) = (f_output(:,4))*n

%% Column 6 CDF*n
f_output(:,6) = round(f_output(:,5));

%% Define LUT with the Histogram Equalization
IN = f_output(:,1);
OUT =  f_output(:,6);

%% Use LUT to create new image
[row, col] = size(f);
g = f;

for i = 1:row
    for j = 1:col
        g(i, j) = OUT(f(i,j)+1, 1);
    end
end

g = int8(g);


figure; imhist(f); title('Original naivasha bw f.jpg');xlabel('Gray Level'); ylabel('Pixel Count');
figure; imhist(g); title('Equalized Histogram of naivasha bw f.jpg');xlabel('Gray Level'); ylabel('Pixel Count');
figure; imshow(f); title('Original naivasha bw f.jpg');
figure; imshow(g); title('Equalized Histogram of naivasha bw f.jpg');

end



