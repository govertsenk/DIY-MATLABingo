%% Set Up Game
% Make a directory of the Tiles stored as PNG's in the Tile Folder. You
% Must add your own pngs to this folder. They will not sync to github.
tiles = dir(strcat(pwd,'/Tiles'));

% Keep just the tiles
tiles = tiles(~ismember({tiles.name},{'.','..'}));

% If you have little biographies for each tile:
tileBios = dir(strcat(pwd,'/TileBios'));
tileBios = tileBios(~ismember({tileBios.name},{'.','..'}));


% Split Tiles into 5 Columns
numCol = 5;
numTiles = length(tiles);

%% define max num of boards
numBoards = 50;

%% Make 50 Bingo Cards
bingoCards = makeBingoCards(tiles, numCol,numBoards);

%% Save Call Order for each 
for iNum = 10:numBoards
[callOrder, winners] = winnerCheck(bingoCards,numTiles,iNum);
save(strcat(pwd,'\CallOrder\',num2str(iNum),'PlayerCallOrders.mat'),'callOrder')
save(strcat(pwd,'\CallOrder\',num2str(iNum),'winners.mat'),'winners')
end 