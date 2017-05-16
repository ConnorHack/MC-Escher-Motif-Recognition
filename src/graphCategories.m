function graphCategories(I,C)

    for i = 1:numel(C)
        clf
        n = ceil( sqrt( numel(C{i}) ) );
        % CHANGE to only show biggest
        imagescMulti( cc2frame( I , C{i} ) , n , n );
        pause
    end

end