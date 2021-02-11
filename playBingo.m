%% Set Up Game
% Make a directory of the Tiles stored as PNG's in the Tile Folder. You
% Must add your own pngs to this folder. They will not sync to github.
tiles = dir(strcat(pwd,'/Tiles'));

% Keep just the tiles
tiles = tiles(~ismember({tiles.name},{'.','..'}));

% If you have little biographies for each tile:
tileBios = dir(strcat(pwd,'/TileBios'));
tileBios = tileBios(~ismember({tileBios.name},{'.','..'}));

% How Many Players?
numPlayers = str2double(cell2mat(inputdlg({'How Many Players?'},'Game Set Up 2 ')));

% What are their emails?
emailList = cell(numPlayers,2);
for iPlayer = 1:numPlayers
    emailList{iPlayer,2} = strcat('Player',num2str(iPlayer),'E-mail');
end
emailList(:,1) = inputdlg(emailList(:,2),'Emails');

% Split Tiles into 5 Columns
numCol = 5;
numTiles = length(tiles);

%% Make Bingo Cards and Call Order
bingoCards = makeBingoCards(tiles, emailList(:,1), numPlayers,numCol,numTiles);

callOrder = winnerCheck(bingoCards,numTiles,numPlayers);

fourCornersWinner = 0;
bingoWinner = 0;
crossWinner = 0;
coverAllWinner = 0;


%% Play Bingo!
% To reset call board: clear check clf
check = zeros(size(bingoCards));
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
    if fourCornersWinner == 0
        fourCornersWinner = fourCorners(check,numPlayers,fourCornersWinner);
        if fourCornersWinner > 0
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/fourCorners.png'));
            msg = strcat(emailList{fourCornersWinner,1},' has Four Corners! Congratulations!');
            i = msgbox(msg,'Four Corner Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if bingoWinner == 0
        bingoWinner = bingo(check, numPlayers, bingoWinner);
        if bingoWinner > 0
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/bingo.png'));
            msg = strcat(emailList{bingoWinner,1},' has Bingo! Congratulations!');
            i = msgbox(msg,'Bingo Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if crossWinner == 0
        crossWinner = cross(check,numPlayers,crossWinner);
        if crossWinner > 0
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/X.png'));
            msg = strcat(emailList{crossWinner,1},' has the X! Congratulations!');
            i = msgbox(msg,'X Winner','custom',icondata,iconcmap);
            uiwait(i)
        end
    end
    if coverAllWinner == 0
        coverAllWinner = coverAll(check, numPlayers, coverAllWinner);
        if coverAllWinner > 0
            [icondata,iconcmap] = imread(strcat(pwd,'/Ways2Win/coverall.png'));
            msg = strcat(emailList{coverAllWinner,1},' has covered them all! Congratulations!');
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

