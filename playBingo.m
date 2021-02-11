% Update Filepath to Folder Where Tile PDFS are saved
filepath = "C:\Users\gover\OneDrive - Northeastern University\Tiles";

% Make a directory of the Tiles from the filepath
tiles = dir(filepath);

% Keep just the PDFS
tiles = tiles(~ismember({tiles.name},{'.','..'}));

% How Many Players?
numPlayers = 20;

% Split Tiles into 5 Columns
numCol = 5;
numTiles = length(tiles);

% Make Bingo Cards
[bingoCards] = makeBingoCards(numPlayers,numCol,numTiles);

callOrder = winnerCheck(bingoCards,numTiles,numPlayers);

fourCornersWinner = 0;
bingoWinner = 0;
crossWinner = 0;
coverAllWinner = 0;
check = zeros(size(bingoCards));

for iCall = 1:numTiles
    check(ind2sub(size(bingoCards == callOrder(iCall)),find(bingoCards == callOrder(iCall)))) = 1;
    if fourCornersWinner == 0
        fourCornersWinner = fourCorners(check,numPlayers,fourCornersWinner);
        if fourCornersWinner > 0
            fprintf('Player %d has Four Courners! Congratulations!\n',fourCornersWinner)
        end
    end
    if bingoWinner == 0
        bingoWinner = bingo(check, numPlayers, bingoWinner);
        if bingoWinner > 0
            fprintf('Player %d has bingo! Congratulations!\n',bingoWinner)
        end
    end
    if crossWinner == 0
        crossWinner = cross(check,numPlayers,crossWinner);
        if crossWinner > 0
            fprintf('Player %d has the X! Congratulations!\n',crossWinner)
        end
    end
    if coverAllWinner == 0
        coverAllWinner = coverAll(check, numPlayers, coverAllWinner);
        if coverAllWinner > 0
            fprintf('Player %d has the covered them all! Congratulations!\n',coverAllWinner)
        end
    end
    if coverAllWinner > 0
        break
    end
    
end

