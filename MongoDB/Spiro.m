R = 8.0;
r = 1.0;
a = 4.0;
t = 0:0.1:16*pi;
x0 = -118.28544683760212;
y0 = 34.0205893248681;
longs=0.0005*((R+r)*cos((r/R)*t)-a*cos((1+r/R)*t)) + x0;
lats=0.0005*((R+r)*sin((r/R)*t)-a*sin((1+r/R)*t)) + y0;
% filename = "spiro.kml";
% shape = geoshape(lats,longs);
% kmlwrite(filename,shape,'Color','red','width',4);

formatSpec = '%.14f';

fid = fopen('SpiroData.txt','wt');

start = '[';
fprintf(fid,'%s\n',start);

for i = 1: length(longs) - 1
    content = [ '{' newline 32 '"loc": ' '[' 32 num2str(longs(i),formatSpec) ',' num2str(lats(i),formatSpec) ']' newline '}' ',' newline];
    fprintf(fid,'%s',content);
end

lastOne = [ '{' newline 32 '"loc": ' '[' 32 num2str(longs(length(longs)),formatSpec) ',' num2str(lats(length(longs)),formatSpec) ']' newline '}' newline];
fprintf(fid,'%s',lastOne);

endString = ']';
fprintf(fid,'%s\n',endString);
fclose(fid);

% fid = fopen('SpiroData.txt','wt');
% fprintf(fid,'%s\n','[');
% fclose(fid);


% figure(1)
% plot(longs, lats, '-r')
% grid
% axis equal