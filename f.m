% function.m 
% Written by John Ryan - johnryan@cmu.edu
% This function returns the number of iterations (if less than 10,000)
% it takes for repeated iteration of f(z) = z^2 + c
% to diverge (have magnitude greater than 2)
function value = f(a, b, julia, window_size)
    if(julia)
        a = 2*a/(window_size); %Scaling somehow for now, not much thought
        b = 2*b/(window_size);
        c_x = -0.79;
        c_y = 0.15;
    else
        c_x = 2*a/(window_size); %Scaling somehow for now, not much thought
        c_y = 2*b/(window_size);
        a=0;
        b=0;
    end
    for i = 1:1000
        %fprintf('a is %f and b is %f\n',a, b); 
        mag = a^2 + b^2;
        %fprintf('mag is %f\n',mag);
        if(mag>2)
            %fprintf('mag too big, returning %f\n', i);
            value = i;
            return;
        end
        temp = a;

        a = a^2 - b^2 + c_x;% - 0.79; %c is 0.5 + 0.5i
        b = 2*temp*b  + c_y;%0.15;
    end
    value = 1000;
