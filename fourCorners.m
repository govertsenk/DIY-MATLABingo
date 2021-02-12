function [fourCornersWinner] = fourCorners(check,numPlayers)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
fourCornersWinner = zeros(numPlayers,1);
    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        if (A(1,1) == 1 && A(1,length(A)) == 1 && A(length(A),1) == 1 && A(length(A),length(A)) == 1)
            fourCornersWinner(iPlayer,1) = 1;
        end
    end
fourCornersWinner = find(fourCornersWinner);
end

