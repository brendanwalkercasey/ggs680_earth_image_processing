function cdf_f=im_cdf_f(f)
%=======================
% Syntax: cdf_f = im_cdf(f)
% Description: this function calculates the CDF of an input image f and
% returns it in a table
% Input: f - a uint8 inage
% Output: cdf_f - the cdf of the input image f as an array, column 1 is the gray level, and column 2 is the CDF value. 
% Note that CDF values are between 0 and 1 since they represent cumulative probabilities.
%=======================

%% step 1: get the image histogram
[C,T] = imhist(f);

%% step 2: normalize the histogram
C = C./sum(C);

%% step 3: calculate the cumulative sum over the vector C
f = cumsum(C,1);

%% step 4: put everything into the cdf
cdf_f=[T f]; 
