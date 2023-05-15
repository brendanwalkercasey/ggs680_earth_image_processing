%=======================
% Syntax: Houghlines_for_Edges_Image.m
% Description: The script below defines the parameters for the Hough Lines, where the lines are plotted against the edges image 
% Input: 'IAD_Planet.tif' (Denote as "I"), edge image (Denoted as "E" - defined through the Canny edge
% detector)
% Output: Lines corresponding to the top peaks on edges image of 'IAD_Planet.tif' (calculated with the
% "houghlines" command and depicted in 'Edges Image of IAD Planet.tif and Top 30 Peaks' jpg)
%=======================
% Brendan Casey
% Mini-Project
% December 09, 2018
% Task 3, Part 2
%=======================  

% Create Hough lines: Show strongest edges in the edges image based on Hough peaks:
lines = houghlines(E,thetaVec,rhoVec,HT_P,'FillGap',5,'MinLength',7);
figure, imshow(E), hold on
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end

title('Edges Image of IAD Planet.tif and Top 30 Peaks');
