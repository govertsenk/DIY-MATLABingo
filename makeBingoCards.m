function [bingoCards] = makeBingoCards(tiles, emails, numPlayers, numCol, numTiles)
% This function opens a folder which contains the pdfs you wish to use for
% bingo. These pdfs are then compiled and renamed as an ID number in a
% different folder.
%
% The numeric matrices and each idnumber are stored as a 3D matrix to later
% be used to verify winners

% Make Empty Bingo Matrix
bingoCards = zeros(numCol,numCol,numPlayers);
subplotNumbering = [1:5;6:10;11:15;16:20;21:25];

for iPlayer = 1:numPlayers
    bingoCards(:,1,iPlayer) = randperm(9,5)';
    bingoCards(:,2,iPlayer) = randperm(9,5)'+9;
    bingoCards(:,3,iPlayer) = randperm(9,5)'+9*2;
    bingoCards(:,4,iPlayer) = randperm(9,5)'+9*3;
    bingoCards(:,5,iPlayer) = randperm(9,5)'+9*4;
    
    % Make free space 0
    bingoCards(3,3,iPlayer) = 0;
end

% % % Sign into your email
% prompt = {'Enter your email:','Enter your email password:'};
% dlgtitle = 'Email Log In';
% answer = inputdlg({'Email','Password'},'Email Log In');
% 
% % Make bingo boards
% for iPlayer = 1:numPlayers
%     figure('units','inch','position',[0,0,8,8])
%     for idX = 1:25
%         subplot(5,5,subplotNumbering(idX))
%         if bingoCards(idX) > 0
%             imshow(imread(strcat(pwd,'/Tiles/',tiles(bingoCards(idX)).name)))
%         else
%             imshow(imread(strcat(pwd,'/Free Space/','FreeSpace.png')))
%         end
%     end
%     sgtitle(strcat(num2str(emails{iPlayer}),', Thank You For Playing GWiSE BINGO!'))
%     saveas(gcf,strcat(pwd,'/BingoCards/',num2str(iPlayer),'.pdf'))
%     
%     setpref('Internet','E_mail',answer{1});
%     setpref('Internet','SMTP_Server','smtp.gmail.com');
%     setpref('Internet','SMTP_Username',answer{1});
%     setpref('Internet','SMTP_Password',answer{2});
%     props = java.lang.System.getProperties;
%     props.setProperty( 'mail.smtp.starttls.enable', 'true' );
%     props.setProperty('mail.smtp.auth','true');
%     props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
%     props.setProperty('mail.smtp.socketFactory.port','465');
%     sendmail(emails(iPlayer),'GWiSE BINGO', ...
%         'Here is your Bingo Card! Good Luck!',strcat(pwd,'/BingoCards/',num2str(iPlayer),'.pdf'));
%     clf
% end

end

