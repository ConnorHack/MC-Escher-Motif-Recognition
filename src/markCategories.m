function I = markCategories( I , C )

clf
imagesc(I)
hold on

    [y x] = size(I);
%    colors = prism(numel(C));
    colors = linspace(0,255,numel(C));

    for i = 1:numel(C)
        c = C{i};
        for j = 1:numel(c)
            I(c{j}) = colors(i);
            [ys xs] = ind2sub(c{j},[y x]);
            ty = min(ys);
            tx = min(xs);
            text( tx , ty , sprintf( '%d' , i ) , 'FontSize' , 20 );
%            I(ys,xs,1) = colors(i,1);
%            I(ys,xs,2) = colors(i,2);
%            I(ys,xs,3) = colors(i,3);
        end
    end

hold off

end
