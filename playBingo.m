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

% Load Bingo Cards
load(strcat(pwd,'/BingoCards/bingoCards.mat'))

%% %% Upload Player CV
% Save a xlsx or csv of players where the first column is their email
% addresses 
[~,Players,~]= xlsread('C:/Users/gover/Northeastern University/GWISE - Superwise2 - 03 - March - Wonder Women''s  Bingo/Players.xlsx');

% How Many Players?
numPlayers = length(Players); 
emails = Players(:,1);

% Resize bingocards to keep only the num we need
bingoCards = bingoCards(:,:,1:numPlayers);

%% Load 
load(strcat(pwd,'/CallOrder/',num2str(numPlayers),'PlayerCallOrders.mat'))
load(strcat(pwd,'/CallOrder/',num2str(numPlayers),'winners.mat'))
fprintf('The winners will be: \n four corner: %d \n bingo: %d \n cross: %d \n coverall: %d! \n',winners(1),winners(2),winners(3),winners(4))

%% Play Bingo!
fourCornersWinner = [];
bingoWinner = [];
crossWinner = [];
coverAllWinner = [];

% To reset call board: clear check clf
check = zeros(size(bingoCards));

% Add free space 
check(3,3,:) = 1; 

for iCall = 1:numTiles
    
    figure(1)
    set(gcf,'Name','Call Board');
    set(gcf,'Position',[2742.5,-129.5,1329,962]);
    subplot(5,9,callOrder(iCall)), imshow(imread(strcat(pwd,'/Tiles/',tiles(callOrder(iCall)).name)))
    sgtitle('GWiSE Wonder Women Bingo Call Board')
    
    figure(2)
    set(gcf,'Name','Tile Bio');
    imshow(imread(strcat(pwd,'/TileBios/',tileBios(callOrder(iCall)).name)));
    set(gcf,'Position',[4080,-15,569.5,846]);
    
    check(ind2sub(size(bingoCards == callOrder(iCall)),find(bingoCards == callOrder(iCall)))) = 1;
    if isempty(fourCornersWinner)
        fourCornersWinner = fourCorners(check,numPlayers);
        if ~isempty(fourCornersWinner)
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/fourCorners.png'));
            msg = strcat('When iCall=',{' '},num2str(iCall),{' '},'Player Number',{' '},num2str(fourCornersWinner),{' '},emails{fourCornersWinner,1},{' '},' has Four Corners! Congratulations!');
            i = msgbox(msg,'Four Corner Winner','custom',icondata,iconcmap);
                  uiwait(i)
        end
    end
    if isempty(bingoWinner)
        bingoWinner = bingo(check, numPlayers);
        if ~isempty(bingoWinner)
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/bingo.png'));
            msg = strcat('When iCall= ',{' '},num2str(iCall),{' '},' Player Number ', {' '},num2str(bingoWinner),' ',emails{bingoWinner,1},{' '},' has Bingo! Congratulations!');
            i = msgbox(msg,'Bingo Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if isempty(crossWinner)
        crossWinner = cross(check,numPlayers);
        if ~isempty(crossWinner)
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/X.png'));
            msg = strcat('When iCall= ',{' '},num2str(iCall),{' '},' Player Number ', {' '},num2str(crossWinner),{' '},emails{crossWinner,1},{' '},' has the X! Congratulations!');
            i = msgbox(msg,'X Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if isempty(coverAllWinner)
        coverAllWinner = coverAll(check, numPlayers);
        if ~isempty(coverAllWinner)
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/coverall.png'));
            msg = strcat('When iCall= ',{' '},num2str(iCall),{' '},' Player Number ', {' '},num2str(coverAllWinner),{' '},emails{coverAllWinner,1},{' '},' has covered them all! Congratulations!');
            i = msgbox(msg,'Coverall Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if coverAllWinner > 0
        break
    end
    h = msgbox('Next Call? Click OK','Call Operator');
    set(h,'Position',[3061.125,-91.125,424.875,49.875])
    uiwait(h);
    
end

%% Select ' Cool Cat ' 
players = [1:numPlayers];
[~,loc] = ismember(winners,players);
players(loc) = [];
coolcat = players(randperm(length(players),1));
msg = strcat('The "Cool Cat" is Player Number',{' '},num2str(coolcat),{' '},emails{coolcat,1},'! Congratulations!');
i = msgbox(msg,'Cool Cat Winner');