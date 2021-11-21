R = 8.0;
r = 1.0;
a = 4.0;
t = 0:0.01:16*pi;
x0 = -118.28544683760212;
y0 = 34.0205893248681;
longs=0.0005*((R+r)*cos((r/R)*t)-a*cos((1+r/R)*t)) + x0;
lats=0.0005*((R+r)*sin((r/R)*t)-a*sin((1+r/R)*t)) + y0;
filename = "spiro.kml";
shape = geoshape(lats,longs);
kmlwrite(filename,shape,'Color','red','width',4);



figure(1)
plot(longs, lats, '-r')
grid
axis equal