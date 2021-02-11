function [callOrder] = winnerCheck(bingoCards,numTiles,numPlayers)

winner = zeros(4,1);

while length(winner)==length(unique(winner)) == 0
    
    % GameCheck
    check = zeros(size(bingoCards));
    winner = zeros(4,1);
    
    fourCornersWinner = 0;
    bingoWinner = 0;
    crossWinner = 0;
    coverAllWinner = 0;
    
    % Call Order
    callOrder = randperm(numTiles);
    
    for iCall = 1:numTiles
        check(ind2sub(size(bingoCards == callOrder(iCall)),find(bingoCards == callOrder(iCall)))) = 1;
        if fourCornersWinner == 0
            fourCornersWinner = fourCorners(check,numPlayers,fourCornersWinner);
            if fourCornersWinner > 0
                winner(1)= fourCornersWinner;
            end
        end
        if bingoWinner == 0
            bingoWinner = bingo(check, numPlayers, bingoWinner);
            if bingoWinner > 0
                winner(2) = bingoWinner;
            end
        end
        if crossWinner == 0
            crossWinner = cross(check,numPlayers,crossWinner);
            if crossWinner > 0
                winner(3) = crossWinner;
            end
        end
        if coverAllWinner == 0
            coverAllWinner = coverAll(check, numPlayers, coverAllWinner);
            if coverAllWinner > 0
                winner(4) = coverAllWinner;
            end
        end
        
        if coverAllWinner > 0
            break
        end
    end
end

end

