function graphCategories(I,C)

    for i = 1:numel(C)
        n = ceil( sqrt( numel(C{i}) ) );
	c = C{i};

        imagescMulti( cc2frame( I , C{i} ) , n , n );

        if i ~= numel(C)
            pause;
        end
    end

end
