function K = kernel( type , sze )

	switch(type)
	case 'Identity'
		K = 1;
	case 'Vline'
		K = ones(sze,1);
	case 'Hline'
		K = ones(1,sze);
	case 'Cross'
		K = zeros(sze);
		K( ceil( sze/2 ) , : ) = 1;
		K( : , ceil( sze/2 ) ) = 1;
	case 'Diamond'
		K = zeros(sze);
		j = floor(sze/2);
		bias = mod(sze+1,2);
		for i = 1:sze
			K(abs(j)+1:sze-abs(j)+bias,i) = 1;
			j = j - 1;
		end
	case 'Square'
		K = ones(sze);
	case 'Disc'
		K = zeros(sze);
		os = ceil(sze/2);
		for i = 1:sze
			for j = 1:sze
				if sqrt((i-os)^2+(j-os)^2) < os
					K(i,j) = 1;
				end
			end
		end

	case 'CheckerBoard'
		K = zeros(sze);
		for i = 1:sze*sze
			K(i) = mod(i,2);
		end

	case 'Rand'
		K = round(rand(sze));
        case 'Diagonal'
                K = zeros(sze);
                for i = 1:sze
                    K(sze-i+1,i) = 1;
                end
        case 'NegDiagonal'
                K = zeros(sze);
                for i = 1:sze
                    K(i,i) = 1;
                end
	end

end
