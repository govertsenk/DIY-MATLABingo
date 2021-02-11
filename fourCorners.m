function [fourCornerWinner] = fourCorners(check,numPlayers,fourCornerWinner)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        if (A(1,1) == 1 && A(1,length(A)) == 1 && A(length(A),1) == 1 && A(length(A),length(A)) == 1)
            fourCornerWinner = iPlayer;
        end
    end
end

