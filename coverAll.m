function [coverAllWinner] = coverAll(check, numPlayers, coverAllWinner)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        A(3,3)=1;
        if all(all(A))
            coverAllWinner = iPlayer;
        end
    end


end

