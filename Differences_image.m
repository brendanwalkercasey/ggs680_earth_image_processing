%=========================================================================
% Syntax: A=f;B=g;Differences_image = A-B;double(Differences_image);figure, subplot, imagesc(Differences_image)
% Description: The script below generates a differences image operation of
%   input image f(base image), and input image g(target image).  
% Input:  g - a uint8 image
        % f - a uint8 image
% Output: 
        % Differences_image- an image representing areas most affected areas of the two input images (f, and
        %   g)'s histogram matching operation
% Name: Brendan Casey
% Lab: Assignment 4
% Quesiton Number: 1,c
% Date: 11/20/2018
%=========================================================================



A=f;
B=g;
Differences_image = A-B;
double(Differences_image);
figure, subplot, imagesc(Differences_image)

% Commands:
% -----------------------------------------------------------------------
% f= imread('naivasha_bw_f.jpg');
% g= imread('naivasha_bw_g.jpg');
% cdf_f=im_cdf_f(f);
% cdf_g=im_cdf_g(g);
% LUT = inv_cdf(cdf_f, cdf_g); 
% n= 8; 
% f_Out= intlut(f,LUT(:,2));


%  /OR/

% f= imread('naivasha_bw_f.jpg');g= imread('naivasha_bw_g.jpg');cdf_f=im_cdf_f(f);cdf_g=im_cdf_g(g);LUT = inv_cdf(cdf_f, cdf_g); n= 8; f_Out= intlut(f,LUT(:,2));


% A=f;
% B=g;
% Differences_image = A-B;
% double(Differences_image);
% figure, subplot, imagesc(Differences_image)

%  /OR/

% A=f;B=g; Differences_image = A-B;double(Differences_image);figure, subplot, imagesc(Differences_image)

% -----------------------------------------------------------------------
