function [crossWinner] = cross(check,numPlayers)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
crossWinner = zeros(numPlayers,1);

if crossWinner == 0
    for iPlayer = 1:numPlayers
        A = check(:,:,iPlayer);
        if A(1,1) == 1 && A(1,length(A)) == 1 && A(length(A),1) == 1 &&...
                A(length(A),length(A)) == 1 && A(2,2) == 1 && A(4,4) == 1 &&...
                A(2,4) == 1 && A(4,2) == 1
            
            crossWinner(iPlayer,1)=1;
        end
    end
crossWinner = find(crossWinner);
end

