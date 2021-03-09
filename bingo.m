function [bingoWinner] = bingo(check, numPlayers)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%   Detailed explanation goes here
bingoWinner = zeros(numPlayers,1);
    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        for iCol = 1:length(A)
            if all(A(:,iCol) == 1) || all(A(iCol,:) == 1)
              
                bingoWinner(iPlayer,1) = 1;
            end
        end
    end
bingoWinner = find(bingoWinner);
end

