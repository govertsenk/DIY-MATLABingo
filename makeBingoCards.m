function [bingoCards] = makeBingoCards(tiles, numCol, numCards)
% This function opens a folder which contains the pdfs you wish to use for
% bingo. These pdfs are then compiled and renamed as an ID number in a
% different folder.
%
% The numeric matrices and each idnumber are stored as a 3D matrix to later
% be used to verify winners

% Make Empty Bingo Matrix
bingoCards = zeros(numCol,numCol,numCards);
subplotNumbering = [1:5;6:10;11:15;16:20;21:25];

for iCard = 1:numCards
    bingoCards(:,1,iCard) = randperm(9,5)';
    bingoCards(:,2,iCard) = randperm(9,5)'+9;
    bingoCards(:,3,iCard) = randperm(9,5)'+9*2;
    bingoCards(:,4,iCard) = randperm(9,5)'+9*3;
    bingoCards(:,5,iCard) = randperm(9,5)'+9*4;
    
    % Make free space 0
    bingoCards(3,3,iCard) = 0;
end
% Save Bingo Card Array
save(strcat(pwd,'/BingoCards/bingoCards.mat'))

% Make bingo boards
for iCard = 1:numCards
    figure('units','inch','position',[0,0,8,8],'visible','off')
    for idX = 1:25
        subplot(5,5,subplotNumbering(idX))
        bingoCard = bingoCards(:,:,iCard);
        if bingoCard(idX) > 0
            imshow(imread(strcat(pwd,'/Tiles/',tiles(bingoCard(idX)).name)))
        else
            imshow(imread(strcat(pwd,'/Free Space/','FreeSpace.png')))
        end
    end
    sgtitle('Thank You For Playing GWiSE BINGO!')
    saveas(gcf,strcat(pwd,'/BingoCards/BingoCard_PlayerNumber_',num2str(iCard),'.pdf'))
    clf
end


end

