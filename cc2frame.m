function imgs = cc2frame(I,cc)

    imgs = {};

    for i = 1:numel(cc)
        imgs{i} = ind2frame( I , cc{i} );
    end

end
