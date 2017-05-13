function showcc( i , connectivity )

	if nargin < 2
		connectivity = 8;
	end

	cc = bwconncomp( im2bw(i) , connectivity )

	
	for k = 1:cc.NumObjects
		ii = i;
		ii(cc.PixelIdxList{k}) = 0;
		imagesc(ii);
		pause;
	end

end
