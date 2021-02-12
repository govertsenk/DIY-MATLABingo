function [callOrder] = winnerCheck(bingoCards,numTiles,numPlayers)

winner = zeros(4,1);

while length(winner)==length(unique(winner)) == 0
    winner = zeros(4,1);
    % GameCheck
    check = zeros(size(bingoCards));
    
    fourCornersWinner = [];
    bingoWinner = [];
    crossWinner = [];
    coverAllWinner = [];
    
    % Call Order
    callOrder = randperm(numTiles);
    
    for iCall = 1:numTiles
        if iCall >= 4
            check(ind2sub(size(bingoCards == callOrder(iCall)),find(bingoCards == callOrder(iCall)))) = 1;
            
            % Check 4  Corners
            if isempty(fourCornersWinner)
                fourCornersWinner = fourCorners(check,numPlayers);
                if ~isempty(fourCornersWinner)
                    if length(fourCornersWinner)>1
                        break
                    end
                    if fourCornersWinner > 0
                        winner(1)= fourCornersWinner;
                    end
                end
            end
            % Check Bingo
            if isempty(bingoWinner)
                bingoWinner = bingo(check, numPlayers);
                if ~isempty(bingoWinner)
                    if length(bingoWinner)>1
                        break
                    end
                    if bingoWinner > 0
                        winner(2) = bingoWinner;
                    end
                end
            end
            % Check crossWinner
            if isempty(crossWinner)
                crossWinner = cross(check,numPlayers);
                if ~isempty(crossWinner)
                    if length(crossWinner)>1
                        break
                    end
                    if crossWinner > 0
                        winner(3) = crossWinner;
                    end
                end
            end
        end
        % Check Cover All Winner
        if isempty(coverAllWinner)
            coverAllWinner = coverAll(check, numPlayers);
            if ~isempty(coverAllWinner)
                if length(coverAllWinner)>1
                    break
                end
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
end


