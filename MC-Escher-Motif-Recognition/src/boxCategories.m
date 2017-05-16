
function I = boxCategories(I,C)

    colors = 255 * prism(numel(I)+2);
    
    colors = colors(2:end-1,:); % No Black or White

    for i = 1:numel(C)
        c = C{i};
        for j = 1:numel(c)
            
            [y x] = ind2sub(size(I),c{j});
            t = min(y);  %top
            b = max(y);  %bottom
            l = min(x);  %left
            r = max(x);  %right
            I = insertShape(I,'Rectangle', [l t (r-l) (b-t)] ,'LineWidth',5,'Color',colors(i,:));
        end
    end

end
