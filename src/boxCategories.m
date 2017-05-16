function I = boxCategories(I,C)

    colors = prism(numel(I));
    
    hold on
    imagesc(I)
    
    for i = 1:numel(C)
        c = C{i};
      %  data = regionprops(c, 'boundingbox');
        
        for j = 1:numel(c)
       %     bb = data(j).BoundingBox;
            
            [y x] = ind2sub(size(I),c{j});
            t = min(y);  %top
            b = max(y);  %bottom
            l = min(x);  %left
            r = max(x);  %right
            
            I = insertShape(I,'Rectangle', ,'LineWidth',5);
        end
    end

end