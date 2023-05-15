function cdf_g=im_cdf_g(g)
%=======================
% Syntax: cdf_g = im_cdf(g)
% Description: this function calculates the CDF of an input image g and
% returns it in a table
% Input: g - a uint8 image
% Output: cdf_g - the cdf of the input image g as an array, column 1 is the gray level, and column 2 is the CDF value. 
% Note that CDF values are between 0 and 1 since they represent cumulative probabilities.
%=======================

%% step 1: get the image histogram
[C,T] = imhist(g);

%% step 2: normalize the histogram
C = C./sum(C);

%% step 3: calculate the cumulative sum over the vector C
g = cumsum(C,1);

%% step 4: put everything into the cdf
cdf_g=[T g]; 
