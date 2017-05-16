% Function MorphCycle applies morphological operations represented as
%   anonymous functions in f_list, giving kernel of type defined by k_list
%   and size as the current iteration.
%   The function and kernel type selected from f_list and k_list is 
%   determined by the modular index of the list and the iterations.
function image = morphCycle( image , f_list , k_list , iterations )

	if numel(iterations) == 1
		iterations = 1:iterations;
	end


	for i = iterations
		image = f_list{mod(i,numel(f_list)) + 1} ...
		    ( image , kernel(k_list{mod(i,numel(k_list))+ 1},i));
	end

end
