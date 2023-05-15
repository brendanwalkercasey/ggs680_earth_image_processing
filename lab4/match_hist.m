%=========================================================================
% Syntax: x = match_hist(f, LUT) /or/ Matched_Image= intlut(f,LUT(:,2))
% Description: Both functions perform a histogram matching operation of
%   input image f(base image), and input image g(target image).  This
%   operation relies on previous functions calculating the CDF and LUT
%   (determined from the inverse CDF of cdf_f, and cdf_g).  
% Input: g - a uint8 image
        %f - a uint8 image
        %n - number of bits per pixel (in this case 8, as defined below)
% Output: 
        %cdf[f,g] - Two 'Cumulative Distribution Function's' (defined and determined in im_cdf_f,
            %and im_cdf_g)
        %LUT - A 'Look Up Table' (defined and determined in inv_cdf.m, where calculations for the inverse
            %CDF based on the CDF of f and the CDF of g are performed)
        %Matched_image - an image representing a matched histogram of the two input images (f, and
            %g)'s histograms
% Name: Brendan Casey
% Lab: Assignment 4
% Quesiton Number: 1,a) and b)
% Date: 11/20/2018
%=========================================================================


%Command Line inputs:  
% (Note: all files referenced below should be in the same directory)
    %f= imread('naivasha_bw_f.jpg');
    %g= imread('naivasha_bw_g.jpg');
    %cdf_f=im_cdf_f(f);
    %cdf_g=im_cdf_g(g);
    %LUT = inv_cdf(cdf_f, cdf_g)
        %in = LUT(:,1);
        %out = LUT(:,2);
        %n= 8
        %x = match_hist(f, LUT) [My function modified from the function depicted in Task 2 of the third Assignment]
       
        
        %  /Or/
        %  Matched_Image= intlut(f,LUT(:,2)); [This was unused, as the Analyst wished to apply his own function called "x = match_hist(f, LUT)"]
            %where:
                %variables (in/out)(defined above) are undefined and unused

 %   /Or/
 
    %f= imread('naivasha_bw_f.jpg');g= imread('naivasha_bw_g.jpg');cdf_f=im_cdf_f(f);cdf_g=im_cdf_g(g);LUT = inv_cdf(cdf_f, cdf_g); n= 8;

 
    function m = match_hist(f, LUT)


%Task 1:
    % Part a:
        % Write a Matlab function which applies a Lookup Table (LUT) pixel
        % value transformation to a given image.  The function will receive
        % as the input the following parameters:
        
        % where:
         % f = input image
         % n = number of bits per pixel
         % in = input LUT values
         % out = output LUT values
   [row,col] = size(f); % This returns the number of rows and columns in the image(f).  I.E. In order for the function to apply the transformation to each pixel in the image, we need to define the size of the image by writing this
         m = f;  % This creates a copy of the original image
            in = LUT(:,1);
            out = LUT(:,2);

for i = 1:row % First loop
   
    for j = 1:col % Second loop
        
       % Convert the pixel value at image corrdinates(i,j) to the new value
       % according to the LUT that was provided (note the here the LUT is
       % comprised of two input variables fo the function, namely "in" and
       % "out").
        m(i, j) = out((f(i,j)+1));

    end 
   
end

I = imread('naivasha_bw_f.jpg'), X = imread('naivasha_bw_g.jpg');

figure, imshow(I), title('Original naivasha bw f.jpg');
figure, imshow(X), title ('Original naivasha bw g.jpg');
figure, imshow(m), title('Matched Histogram Image'); 
figure, imhist(I);title ('Original naivasha bw f.jpg'); xlabel('Gray Level'); ylabel('Pixel Count');
figure, imhist(X);title ('Original naivasha bw g.jpg'); xlabel('Gray Level'); ylabel('Pixel Count');
figure, imhist(m); title('Matched Histogram Image'); xlabel('Gray Level');ylabel('Pixel Count');

end




