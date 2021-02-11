function [bingoWinner] = bingo(check, numPlayers, bingoWinner)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
%   Detailed explanation goes here
    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        for iCol = 1:length(A)
            if all(A(:,iCol) == 1) || all(A(iCol,:) == 1)
              
                bingoWinner = iPlayer;
            end
        end
    end
end

