function categories = pipeline( image , morphology , similarity , threshold , opt )

  if nargin < 5
    opt = 'Default';
  end

  bw_image = im2bw( image );

  morphed_image = morphology( bw_image );
  
  connected_components = bwconncomp( morphed_image );

  categories = categorize( morphed_image , connected_components , similarity , threshold , opt );

end
