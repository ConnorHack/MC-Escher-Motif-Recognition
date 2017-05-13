function dem( d , I , range )

	close = @(arg1,arg2) imclose(arg1,arg2);
	open  = @(arg1,arg2) imopen(arg1,arg2);

	Ibw = double(im2bw(I));


	switch( d )
	case 1
		imagesc( morphOsc( Ibw , open , close , 'Diamond' , 'Vline' , range ) );
		fprintf( 'Diamond & Vline\n' )
	case 2
		imagesc( morphOsc( Ibw , open , close , 'Hline' , 'Vline' , range ) );
		fprintf( 'Hline & Vline\n' )
	case 3
		imagesc( morphOsc( Ibw , open , close , 'Hline' , 'Diamond' , range ) );
		fprintf( 'Hline & Diamond\n' )
	case 4
		fprintf( 'Hline & Diamond -> Prewit\n' )
		Gy = [-1 -1 -1 ; 0 0 0 ; 1 1 1];
		Gx = [-1 0 1 ; -1 0 1 ; -1 0 1];
		i = morphOsc( Ibw , open , close , 'Hline' , 'Diamond' , range );
		i = conv2( conv2( i , Gy ) , Gx );
		imshow( i );
	case 5
		fprintf( 'Hline & Diamond -> Sobel-Feldman\n' )
		Gy = [-1 -2 -1 ; 0 0 0 ; 1 2 1];
		Gx = [-1 0 1 ; -2 0 2 ; -1 0 1];
		i = morphOsc( Ibw , open , close , 'Hline' , 'Diamond' , range );
		i = conv2( conv2( i , Gy ) , Gx );
		imshow( i );
	end

end
