function imagescMulti( imgs , w , h )

   k = 1;

   clf

   for i = 1:w
       for j = 1:h
           subplot(w,h,k);
           axis equal;
           imagesc(imgs{k});
           k = k + 1;
           if k >= numel(imgs) 
               return;
           end
       end
   end

end
