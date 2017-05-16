function I = morph( I )
 
    I = imclose( I , kernel( 'Disc' , 8 ) );
    I = imopen( I , kernel( 'NegDiagonal' , 25 ));
    I = imopen( I , kernel( 'Hline' , 10 ) );
    I = imopen( I , kernel( 'Diagonal' , 17 ) );
    I = imopen( I , kernel( 'Diagonal' , 17 ) );
    I = imclose( I , kernel( 'Disc' , 10 ) );

end
