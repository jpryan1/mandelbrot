% mandelbrot.m
% Written by John Ryan - johnryan@cmu.edu
% This is a toy project written after watching a really 
% groovy video of zooming into the Mandelbrot set!

window_size = 1000;

image = zeros(window_size, window_size);
% Initial pass - for loops. This is no good in MATLAB,
% but let's do this first.
c_x = 0;
c_y = 0;
A = [1 0 0; 0 1 0; 0 0 1];
for k = 1:10
    
    for i = 1:window_size
        for j = 1:window_size
            x = i - window_size/2;
            y = j - window_size/2;
            point = A*[x; y; 1];
            point = point./point(3);
            
            image(i,j) = f(point(1),point(2));
        end
    end
    imagesc(image), colormap('hsv');
%     image = image/(max(max(image)));
%     imshow(image), colormap('hsv');
    [c_x,c_y] = ginput(1);
    c_x = (c_x - window_size/2);
    c_y = (c_y - window_size/2);
    A = A*[0.5 0 c_y; 0 0.5 c_x; 0 0 1];
   

    
end
