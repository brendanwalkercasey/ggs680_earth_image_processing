%=======================
% Syntax: Hough_T.m
% Description: The function below calculates a Hough Transformation
% given an input image, and an edge detector operation
% Input: The input image(f) (an edges image calculated using an edge
% detector, such as the Canny Edge detector)
% Output: Calculations for Theta (Denoted as "thetaVec" - angle of normal representation of the
% line to the x-axis), and Rho (Denoted as "rhoVec" - distnce of normal representation of the line
% from coordinate center) and image coordinates of individual edge pixels (x,y) are used to determine the
% accumulator array (Denoted as "accumulatorMatrix" - The Hough Transformation 
% accumulator)
%=======================
% Brendan Casey
% Mini-Project
% December 10, 2018
% Task 3
%=======================  

function [accumulatorMatrix, thetaVec, rhoVec] = Hough_T(f)
    
    thetaVec = [-90:89];

% Define size of the image (D), in order to find the rho_max. Rho Max equals
% the distance of the diagonal of the image.  This is equivalent to the 
% longest "Normal line" of rho max.  We use rho max to find the vector of
% rho values (R)
    D = size(f);
    rho_max = floor((D(1)^2 + D(2)^2)^0.5);
    rhoVec = [-rho_max + 1 : rho_max];
% Define the accumulator based on "T" and "R" values.  The default setting
% for the bins size is "1."  All values in the accumulator are set to zero
% intially:

    accumulatorMatrix = zeros(length(rhoVec), length(thetaVec));

%Initiallize the find command which runs through all indices of the rows
%and columns of the image (the canny edge detector image as defined in the
%command line):
   
    [row,col] = find(f);
    
% Calculate values in the accumulator array by implementing the Hough Transformation (HT).  This is performed with a nested "for loop.”    
% For every pixel found, calculate the Rho based on the Theta value:

    for k = 1:length(row)
        y = row(k);
        x = col(k);
        
        for i = 1:length(thetaVec)
            R_new = floor((x*cos(thetaVec(i)*(pi/180))) + ((y*sin(thetaVec(i)*pi/180)))) + (rho_max + 1);
            accumulatorMatrix(R_new,i) = accumulatorMatrix(R_new,i) + 1;
            
        end 
    end 
    


