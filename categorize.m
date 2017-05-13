function C = categorize( I , cc , siml , t )

    [y x] = size(I);

    C = {};

    for i = 1:cc.NumObjects
        placed = false;
        for j = 1:numel(C)
            similarities = zeros(1,numel(C{j}));
            c = C{j};
            for k = 1:numel(c)
                [s d] = siml( I , c{k} , cc.PixelIdxList{i} );
                similarities(k) = s;
            end
            if mean(similarities) > t
                c{end+1} = cc.PixelIdxList{i};
                C{j} = c;
                placed = true;
                break;
            end
        end
        if ~placed
            C{end+1} = {cc.PixelIdxList{i}};
        end
    end

end
