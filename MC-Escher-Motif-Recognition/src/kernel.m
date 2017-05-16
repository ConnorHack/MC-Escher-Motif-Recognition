 function K = kernel( type , sze )%               |
%                                                 |
% function kernel creates structuring elements    |
% of given type and given size sze                |
% @param type The type of the structuring element |
% @param sze  The size of the structuring element |
% returns K   The structuring element             |
%%-------------------------------------------------

	switch(type)
	case 'Identity'	% The Identity structuring Element
		K = 1;
	case 'Vline'    % Vertical Line
		K = ones(sze,1);
	case 'Hline'    % Horizontal Line
		K = ones(1,sze);
	case 'Cross'    % A cross
		K = zeros(sze);
		K( ceil( sze/2 ) , : ) = 1;
		K( : , ceil( sze/2 ) ) = 1;
	case 'Diamond'  % A Diamond
		K = zeros(sze);
		j = floor(sze/2);
		bias = mod(sze+1,2);
		for i = 1:sze
			K(abs(j)+1:sze-abs(j)+bias,i) = 1;
			j = j - 1;
		end
	case 'Square'  % Full Square
		K = ones(sze);
	case 'Disc'    % Disk, Circle, etc...
		K = zeros(sze);
		os = ceil(sze/2);
		for i = 1:sze
			for j = 1:sze
				if sqrt((i-os)^2+(j-os)^2) < os
					K(i,j) = 1;
				end
			end
		end

	case 'CheckerBoard'  % Checkerboard
		K = zeros(sze);
		for i = 1:sze*sze
			K(i) = mod(i,2);
		end

	case 'Rand'          %  Random structuring element
		K = round(rand(sze));
        case 'Diagonal'      %  Positive Diagonal Line
                K = zeros(sze);
                for i = 1:sze
                    K(sze-i+1,i) = 1;
                end
        case 'NegDiagonal'   %  Negative Diagonal Line
                K = zeros(sze);
                for i = 1:sze
                    K(i,i) = 1;
                end
	end

end
