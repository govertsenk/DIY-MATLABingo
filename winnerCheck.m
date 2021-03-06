function [callOrder,winner] = winnerCheck(bingoCards,numTiles,numPlayers)
solution = 0;
iteration = 0;

while solution == 0
    error = 0;
    winner = zeros(4,1);
    
    % GameCheck
    check = zeros(size(bingoCards));
    check(3,3,:) = 1; 
    
    fourCornersWinner = [];
    bingoWinner = [];
    crossWinner = [];
    coverAllWinner = [];
    
    % Call Order
    callOrder = randperm(numTiles);
    iteration = iteration + 1;

    for iCall = 1:numTiles
        check(ind2sub(size(bingoCards == callOrder(iCall)),find(bingoCards == callOrder(iCall)))) = 1;
        
        % Check 4  Corners
        if isempty(fourCornersWinner)
            fourCornersWinner = fourCorners(check,numPlayers);
            if ~isempty(fourCornersWinner)
                if length(fourCornersWinner) == 1
                    winner(1)= fourCornersWinner;
                else
                    error = 1;
                    break
                end
            end
        end
        % Check Bingo
        if isempty(bingoWinner)
            bingoWinner = bingo(check, numPlayers);
            if ~isempty(bingoWinner)
                if length(bingoWinner) == 1
                    winner(2)= bingoWinner;
                else
                    error = 1;
                    break
                end
            end
        end
        
        % Check crossWinner
        if isempty(crossWinner)
            crossWinner = cross(check,numPlayers);
            if ~isempty(crossWinner)
                if length(crossWinner) == 1
                    winner(3)= crossWinner;
                else
                    error = 1;
                    break
                end
            end
        end
        
        % Check Cover All Winner
        if isempty(coverAllWinner)
            coverAllWinner = coverAll(check, numPlayers);
                if ~isempty(coverAllWinner)
                    if length(coverAllWinner) == 1
                        winner(4)= coverAllWinner;
                    else
                        error = 1;
                        break
                    end
            end
        end
        
    end
    if length(nonzeros(winner)) ~= length(unique(nonzeros(winner)))
        error = 1;
    end
    if error == 1
        continue
    end
    
    if error == 0 && ~any(winner == 0) && length(winner) == length(unique(winner))
        solution = 1;
        fprintf('The winners will be: \n four corner: %d \n bingo: %d \n cross: %d \n coverall: %d! \n',fourCornersWinner,bingoWinner, crossWinner, coverAllWinner)
    end

    if iteration == 25
        disp('25 iterations, no solution')
        break
    end
end

end
