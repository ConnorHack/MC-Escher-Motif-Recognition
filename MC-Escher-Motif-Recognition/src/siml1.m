function [s d] = siml1( I , l1 , l2 )

    L1 = ind2frame( I , l1 );
    L2 = ind2frame( I , l2 );

    L2 = imresize(L2,size(L1));

    d = abs(L1 - L2);

    s = 1 - mean(mean(d));

end
