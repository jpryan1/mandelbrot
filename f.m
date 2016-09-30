% function.m 
% Written by John Ryan - johnryan@cmu.edu
% This function returns the number of iterations (if less than 10,000)
% it takes for repeated iteration of f(z) = z^2 + c
% to diverge (have magnitude greater than 2)
function value = f(a, b)

a = a/1000.0; %Scaling somehow for now, not much thought
b = b/1000.0;

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
    a = a^2 - b^2 - 0.79; %c is 0.5 + 0.5i
    b = 2*temp*b  + 0.15;
end
value = 1000;
