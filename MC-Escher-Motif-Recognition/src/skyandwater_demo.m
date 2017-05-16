
skyAndWater = imread('../imgs/SkyAndWater.jpg');

%-----------------------------------------------------------------------------------------
% The morphological function takes an image
%  and returns a reduced version of the image
%  to make separation posible
%-----------------------------------------------------------------------------------------

morphFunction = @(image) morph(image);

%
%-----------------------------------------------------------------------------------------
% The similarity function takes in source image along with two lists of indecies
%     and returns a value in [0,1] where 0 represents two complementary components
%     and 1 represents to identical components
%
% The similarity function we are using now assumes the images are in black and white
%    however this is not required
%
% siml1 considers shape similarity ( does not consider size differences )
% siml2 considers shape congruency ( does consider size differences )
%-----------------------------------------------------------------------------------------

%similarityFunction = @(image,PixelIdxList1,PixelIdxList2) siml1(image,PixelIdxList1,PixelIdxList2);

similarityFunction = @(image,PixelIdxList1,PixelIdxList2) siml2(image,PixelIdxList1,PixelIdxList2);

%-----------------------------------------------------------------------------------------
% threshold defines the required similarity for two objects
%    to be considered in the same category
%-----------------------------------------------------------------------------------------

threshold = .8;

%-----------------------------------------------------------------------------------------
% option alters the behavior of the categorize function
%
%   Biggest - Tells the categorize function to only
%                 return the largest category
%
%   RemoveSingle - Tells the categorize function to
%                     to remove all categories with
%                     a single member
%-----------------------------------------------------------------------------------------

option = 'Biggest';

%-----------------------------------------------------------------------------------------
% Find Fish

fprintf( 'Finding Fish\n' )
fish = pipeline( skyAndWater , morphFunction , similarityFunction , threshold , option );

graphCategories( skyAndWater , fish );

%-----------------------------------------------------------------------------------------
% Wait for user

fprintf( 'Press any key to continue\n' )
pause
%-----------------------------------------------------------------------------------------
% Find Geese

fprintf( 'Finding Geese\n' )
geese = pipeline( 255 - skyAndWater , morphFunction , similarityFunction , threshold , option );

graphCategories( 255 - skyAndWater , geese );

pause
fprintf( 'Press any key to continue\n' )

% Join categories and draw boxes around them
fprintf( 'Plotting image with boxes\n' )

clf

C = joinCellArray(fish,geese);

imagesc(boxCategories(I,C));

