function skyandwater
    %read in file
    og_I = imread( '../imgs/SkyAndWater.jpg' );
    % clear figure
    clf
    %show original image
    imagesc( og_I );
    fprintf('Press any key to continue\n')
    pause;
    % blur then convert to bw
%     I = imgaussfilt( og_I, 4 );
%     I = im2bw( I );
%     imagesc(I);
%     fprintf('Press any key to continue\n')
%     pause;
    % convert imopen and imclose to anonymous functions
    open = @(a,b) imopen(a,b);
    close = @(a,b) imclose(a,b);
    % pass to the morphCycle for birds
%     birdI = I;
%     birdI = morphCycle( birdI , {open, close} , {'Disc','Vline','Hline'} , 8 );
%     birdI = imdilate(birdI,kernel('NegDiagonal', 14));
%     imagesc(birdI);
%     fprintf('Press any key to continue\n');
%     pause;
%     % connected components of BIRDS (only largest)
%     birdI = imcomplement( birdI );
%     bird_cc = bwconncomp( birdI );
%     % create anonymous function for the similarity function
     siml = @(a,b,c) siml1(a,b,c);
%     % get list of categories at .7 confidence 
%     bird_C = categorize( birdI , bird_cc , siml , .7 );
%     graphCategories( birdI, bird_C );
%     imagesc( birdI );
    %%%% FISH
    fI = imgaussfilt( og_I, 10 );
    fI = im2bw( fI ); 
    fishI = fI;
    imagesc(fishI);
    fishI = morphCycle( fishI , {open, close} , {'Diamond','Vline','Hline'} , 8 );
    fishI = imerode(fishI,kernel('NegDiagonal', 14));
    imagesc(fishI);
    fprintf('Press any key to continue\n');
    pause;
    % connected components of FISH
    fish_cc = bwconncomp( fishI );
    % get list of categories at .7 confidence 
    fish_C = categorize( fishI , fish_cc , siml , .7 );
    graphCategories( fishI, fish_C );
end