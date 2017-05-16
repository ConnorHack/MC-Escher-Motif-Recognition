function [s d] = siml2( I , l1 , l2 )


    L1 = ind2frame( I , l1 );
    L2 = ind2frame( I , l2 );

    [y1 x1] = size(L1);
    [y2 x2] = size(L2);

    L2 = imresize(L2,size(L1));

    d = abs(L1 - L2);

    s = 1 - mean(mean(d));

    if x1 < x2
        dx = x1 / x2;
    else
        dx = x2 / x1;
    end

    if y1 < y2
        dy = y1 / y2;
    else
        dy = y2 / y1;
    end

    s = mean( [ s dy dx] );
end
