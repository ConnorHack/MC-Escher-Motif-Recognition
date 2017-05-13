function skyandwater
    %read in file
    I = imread( 'SkyAndWater.jpg' );
    % clear figure
    clf
    %show original image
    imagesc( I );
    fprintf("Press any key to continue")
    pause;
    % convert to bw
    I = im2bw( I );
    % convert imopen and imclose to anonymous functions
    open = @(a,b) imopen(a,b);
    close = @(a,b) imclose(a,b);
    % pass to 
    I = morphCycle( I , {open close} , {'Disc','Vline','Hline'} , 15 );
    imagesc(I);
    fprintf("Press any key to continue");
    pause;
    % connected components
    cc = bwconncomp( I );
    % create anonymous function for the similarity function
    siml = @(a,b,c) siml1(a,b,c);
% 
    C = categorize( I , cc , siml , .7 );

    for i = 1:numel(C)
        clf
        n = ceil( sqrt( numel(C{i}) ) );
        imagescMulti( cc2frame( I , C{i} ) , n , n );
        pause
    end

end