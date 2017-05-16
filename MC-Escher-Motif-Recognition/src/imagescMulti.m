% Displays all images in the cell array imgs
% on a w x h subplot grid
%
% @param imgs - Cell Array of image matricies
% @param w - The width of the grid to display on
% @param h - The height of the grid to display on
%%
function imagescMulti( imgs , w , h )

   k = 1;

   clf

   for i = 1:w
       for j = 1:h
           subplot(w,h,k);
           axis square;
           imagesc(imgs{k});
           k = k + 1;
           if k > numel(imgs) 
               return;
           end
       end
   end

end
