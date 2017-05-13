function f = ind2frame( I , list )

    [y x] = ind2sub( size(I) , list );

    t = min(y);
    b = max(y);
    l = min(x);
    r = max(x);

    I1 = zeros(size(I));
    I1(list) = I(list);

    f = I1(t:b,l:r);

end
