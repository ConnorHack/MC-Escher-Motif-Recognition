function I = morphOsc( I , mrph1 , mrph2 , type1 , type2 , range )

        if numel(range) == 1
            range = 1:range;
        end
	
	for i = range
		I = mrph1( I , kernel( type1 , i ) );
		I = mrph2( I , kernel( type2 , i ) );
	end
end
