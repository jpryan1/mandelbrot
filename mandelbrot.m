% mandelbrot.m
% Written by John Ryan - johnryan@cmu.edu
% This is a toy project written after watching a really 
% groovy video of zooming into the Mandelbrot set!

window_size = 1000;
color = 0;
colors = {'parula','jet','hsv','hot','cool',...
    'spring','summer','autumn','winter'};
julia = 0;
% Initial pass - for loops. This is no good in MATLAB,
% but let's do this first.
c_x = 0;
c_y = 0;
A = [1 0 0; 0 1 0; 0 0 1];
h=figure;
while(1)
    image = zeros(window_size, window_size);
    for i = 1:window_size
        for j = 1:window_size
            x = i - window_size/2;
            y = j - window_size/2;
            point = A*[x; y; 1];
            point = point./point(3);
            
            image(j,i) = f(point(1), point(2), julia, window_size);
        end
    end
    %imagesc(image);%, colormap('hsv');
    image = log(image);
    image = image/(max(max(image)));
    image = imresize(image, [1000 1000]);
    imshow(image), colormap(colors{color+1});%plus one because index
    [c_x,c_y] = ginput(1);
    c_x = (1000*c_x/window_size - window_size/2);
    c_y = (1000*c_y/window_size - window_size/2);
    if(c_x<-(window_size/2))
        close(h);
        break;
    elseif(c_x>(window_size/2))
        A = [1 0 0; 0 1 0; 0 0 1];
    elseif(c_y>(window_size/2))
        A = [1 0 0; 0 1 0; 0 0 1];
        julia = mod(julia+1,2);
    elseif(c_y<-(window_size/2))
        A = [1 0 0; 0 1 0; 0 0 1];
        color = mod(color+1,9); %This redoes the image, which can
                                % be avoided. TODO
    else
        A = A*[0.5 0 c_x; 0 0.5 c_y; 0 0 1];
    end
    
end
