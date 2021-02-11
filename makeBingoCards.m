function [bingoCards] = makeBingoCards(numPlayers, numCol, numTiles)
% This function opens a folder which contains the pdfs you wish to use for 
% bingo. These pdfs are then compiled and renamed as an ID number in a 
% different folder. 
%
% The numeric matrices and each idnumber are stored as a 3D matrix to later
% be used to verify winners

% Make Empty Bingo Matrix 
bingoCards = zeros(numCol,numCol,numPlayers);

for iPlayer = 1:numPlayers; 
    bingoCards(:,1,iPlayer) = randperm(9,5)';
    bingoCards(:,2,iPlayer) = randperm(9,5)'+9;
    bingoCards(:,3,iPlayer) = randperm(9,5)'+9*2;
    bingoCards(:,4,iPlayer) = randperm(9,5)'+9*3;
    bingoCards(:,5,iPlayer) = randperm(9,5)'+9*4;
    
    % Make free space 0 
    bingoCards(3,3,iPlayer) = 0;
end 

% Make bingo boards

% Email PDF to Participants 

end

