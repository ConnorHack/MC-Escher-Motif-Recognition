% Displays wide images by splitting them into a number
% of divisions given by divs and creating a vertical subplot array
%
% @param im - The image to display
% @param divs - The number of divisions to display by
%%
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
