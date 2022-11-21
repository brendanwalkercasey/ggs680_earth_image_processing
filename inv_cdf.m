function LUT = inv_cdf(cdf_f, cdf_g)
%=====================
%Syntax: [LUT] = inv_cdf(cdf_f, cdf_g, plotFlag)
%Input: 
% cdf_f - input CDF of the base image (previously defined in "im_cdf_f.m")
% cdf_g - input CDF of the target image (previously defined in "im_cdf_g.m")
%
%Output: LUT - the lookup table that estimates function T
%Purpose: calculate the lookup table for cdf transform function, plot inverse CDF
%=====================

%% create a zeros  matrix for the LUT
LUT = [cdf_f(:,1) zeros(size(cdf_f(:,1)))];


%% Create the inverse CDF 
for i = 1:size(LUT,1)

    %create a matrix the cdf values of the target
    tempOut = [cdf_g(:,2)];
    
    %take a given base value and create a col vector out of it
    chkVal = cdf_f(i,2) .* ones(size(tempOut));

    %get the squared differences
    Diff_vector = (tempOut - chkVal).^2;

    %get the indexes of the minimum errors
    [min_diff,index] = min(Diff_vector);

    %put the value corresponding to the minimum error into the LUT (take
    %first minimum in case of a tie)
    LUT(i,2) = cdf_g(index(1),1);

end

% Convert the LUT into a unit8 type so it could be used with intlut
% Note: here we assume an 8-bit gray level image
LUT = uint8(LUT);


