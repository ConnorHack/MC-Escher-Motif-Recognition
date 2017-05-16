function C = categorize( I , cc , siml , t , opt )

    if nargin < 5
        opt = 'Default';
    end

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

    if strcmp(opt,'RemoveSingle')              % Remove categories with 1 element
        removed = 0;
        for i = 1:numel(C)
            if( numel(C{i-removed}) == 1 )
                C(i-removed) = [];
                removed = removed + 1;
            end
        end
    elseif strcmp(opt,'Biggest')               % Select only the larget categories
        biggest = C{1};
        for i = 1:numel(C)
            if numel(biggest) < numel(C{i})
                biggest = C{i};
            end
        end
        C = {biggest};
    end


end
