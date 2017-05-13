function image = morphCycle( image , f_list , k_list , iterations )

	if numel(iterations) == 1
		iterations = 1:iterations;
	end


	for i = iterations
		image = f_list{mod(i,numel(f_list)) + 1} ...
		    ( image , kernel(k_list{mod(i,numel(k_list))+ 1},i));
	end

end
