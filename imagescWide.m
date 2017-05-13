function imagescWide(im,divs)

    [y x z] = size(im);

    inc = floor( x / divs );
    imgs = {};

    for i = 1:divs
        imgs{i} = im(:,((i-1)*inc+1):(i*inc+1),:);
        subplot(divs,1,i);
        imagesc(imgs{i});
      
    end


end
