%=======================
% Syntax: Houghpeaks_and_Houghlines.m
% Description: The script below defines the parameters for the Hough
% Transformation function and implements the Hough Transformation, where peak 
% values of the accumulator are plotted and analyzed to determine the 
% extent of each line in the image.  Additionally, the lines are 
% displayed on the original image
% Input: 'IAD_Plnet.tif' (Denoted as "I"), edge image (Denoted as "E" - defined through the Canny edge
% detector)
% Output: The top 30 peaks in the Hough Transformation accumulator using the "houghpeaks" command, (Denoted as "HT_P", 
% the lines corresponding to the top peaks calculated with the "houghlines" command, illustrating the longest detected edge line
%=======================
% Brendan Casey
% Mini-Project
% December 10, 2018
% Task 3, Part 2
%=======================  

% Read the image:
I = imread('IAD_Planet.tif');

% Apply the Canny Edge Detector to the image:
E = edge(I,'canny',[0.35,0.5]);

% Calculate the Hough Transform of the image based on the Accumulator (HT),
% Theta Values (thetaVec), and Rho Values (rhoVec):
[HT, thetaVec, rhoVec] = Hough_T(E);

% Show the original Image:
h_1 = subplot(2,1,1); 
imshow(I), title('IAD Planet.tif');

% Plot the Hough Transform:
h_2 = subplot(2,1,2); 
imshow(imadjust(rescale(HT)),'XData',thetaVec,'YData',rhoVec,...
    'InitialMagnification','fit');
title('Hough transform of Dulles Airstrip');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colorbar;

% Show Hough peaks in the accumulator array:
HT_P  = houghpeaks(HT,30,'threshold',ceil(0.3*max(HT(:))));
x = thetaVec(HT_P(:,2)); y = rhoVec(HT_P(:,1));
plot(x,y,'s','color','blue');



% Create Hough lines: Show strongest edges in the image based on Hough peaks:
lines = houghlines(E,thetaVec,rhoVec,HT_P,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    
    % Plot beginnings and ends of lines:
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    % Determine the endpoints of the longest line segment:
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
        max_len = len;
        xy_long = xy;
    end
end

% Illustrate the longest Hough Lines' edge: 
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','magenta'), title('Top 30 peaks, And Longest Hough Lines Edge');




