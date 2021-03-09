function [coverAllWinner] = coverAll(check, numPlayers)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
coverAllWinner = zeros(numPlayers,1);

    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        if all(all(A))
            coverAllWinner(iPlayer,1)=1;
        end
    end

coverAllWinner = find(coverAllWinner);
end

