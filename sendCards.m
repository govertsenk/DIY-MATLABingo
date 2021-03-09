function sendCards(emails)
% % Sign into your email
prompt = {'Enter your email:','Enter your email password:'};
dlgtitle = 'Email Log In';
answer = inputdlg({'Email','Password'},'Email Log In');
setpref('Internet','E_mail',answer{1});
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',answer{1});
setpref('Internet','SMTP_Password',answer{2});
props = java.lang.System.getProperties;
props.setProperty( 'mail.smtp.starttls.enable', 'true' );
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
numPlayers = length(emails);
for iPlayer = 1:numPlayers
    sendmail(emails(iPlayer),'GWiSE BINGO', ...
        'Here is your Bingo Card! Good Luck!',{strcat(pwd,'/BingoCards/',num2str(iPlayer),'.pdf'),strcat(pwd,'/BingoCards/Ways2Win.pdf')});
end
end 
