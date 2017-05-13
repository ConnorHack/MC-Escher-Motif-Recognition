% Function ind2frame creates a sub images of an image containing
% only the linear positions given by list
% 
% @param I    The original image
% @param list The indicies of the image to use
% @param f    The sub image
function f = ind2frame( I , list )

    % Change to subscripts
    [y x] = ind2sub( size(I) , list );

    % Find top, bottom, left, and right of sub-image
    t = min(y);
    b = max(y);
    l = min(x);
    r = max(x);

    % The new frame
    I1 = zeros(size(I));
    I1(list) = I(list);

    f = I1(t:b,l:r);

end
