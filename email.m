%% %% Upload Player CV
% Save a xlsx or csv of players where the first column is their email
% addresses 
[~,Players,~]= xlsread('C:/Users/gover/Northeastern University/GWISE - Superwise2 - 03 - March - Wonder Women''s  Bingo/Players.xlsx');

% How Many Players?
numPlayers = length(Players); 
emails = Players(:,1);

%% Send necessary number of Bingo Cards 
sendCards(emails)