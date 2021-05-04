% function to generate x(n^2) from x(n)
function [y, m] = n_square(x, n)
    m = [];     % domain
    y = [];     % range
    c = abs(min(n));    % to set reference value (0)
    % iterate over positive domain (>0) for square numbers
    for i=1:max(n)      
        r = sqrt(i);
        if floor(r) == r    % check for square number
            % append m (absolute) and y (relative to reference)
            m(end+1) = r;
            y(end+1) = x(c+i+1);
        end
    end
    % correct for negative and 0 positions
    m = [-fliplr(m) 0 m];
    y = [fliplr(y) x(c) y];
end

% to show only positive and square n values (1, 4 ,9) instead of (1, 2, 3)
% change r to i in:     m(end+1) = r; 
% remove negative (-) sign from fliplr in:   m = [-fliplr(m) 0 m];