function [ image_out ] = draw_brick( posX,posY,L,h,r,image,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%%%%% draw_brick %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will draw a brick according to its position
% (X,Y), its length (L), its height (h), the radius of the corners (r) and
% an existing image. The function will return the image with the new brick
% added on it. The brick is drawn in grey (0.5) and the outline in black. 
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - pos        : position of the center of the brick on the picture
%  - L          : Length of the brick
%  - h          : Height of the brick
%  - r          : Radius of the corners of the brick
%  - image      : Original image
%  - pix_size   : Size of the pixels
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - image_out  : Image with the brick added on it
%
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Determination of the coordinates of the corners
X1=posX-h/2;
X2=posX-h/2+r;
X3=posX+h/2-r;
X4=posX+h/2;

Y1=posY-L/2;
Y2=posY-L/2+r;
Y3=posY+L/2-r;
Y4=posY+L/2;

X1c=round(X1/pix_size*1e3);
X2c=round(X2/pix_size*1e3);
X3c=round(X3/pix_size*1e3);
X4c=round(X4/pix_size*1e3);

Y1c=round(Y1/pix_size*1e3);
Y2c=round(Y2/pix_size*1e3);
Y3c=round(Y3/pix_size*1e3);
Y4c=round(Y4/pix_size*1e3);

% Upper & lower parts

for y=Y2c:Y3c
    if y>0 && y <= size(image,2) && X1c>0 && X1c <= size(image,1)
        image(X1c,y)=0;
    end
end

for y=Y2c:Y3c
    if y>0 && y <= size(image,2) && X4c>0 && X4c <= size(image,1)
        image(X4c,y)=0;
    end
end

% Right & left parts

for x=X2c:X3c
    if x>0 && x <= size(image,1) && Y1c>0 && Y1c <= size(image,2)
        image(x,Y1c)=0;
    end
end

for x=X2c:X3c
    if x>0 && x <= size(image,1) && Y4c>0 && Y4c <= size(image,2)
        image(x,Y4c)=0;
    end
end


round_in_square=ones(X4c-X3c+1,Y4c-Y3c+1);
for i=0:pi/2/50:pi/2
    y=r*cos(i);
    x=r*sin(i);
    round_in_square(max(1,round(x/pix_size*1e3)),max(1,round(y/pix_size*1e3)))=0;
end


% Right lower corner

if X4c<=size(image,1) && X3c<=size(image,1) && Y3c<size(image,2) && Y4c<size(image,2)
    image([X3c:X4c],[Y3c:Y4c])=round_in_square;
end
% Left lower corner
round_in_square=flipud(round_in_square);
if X1c>0 && X2c>0 && Y3c<size(image,2) && Y4c<size(image,2)
    image([X1c:X2c],[Y3c:Y4c])=round_in_square;
end
% Left upper corner
round_in_square=fliplr(round_in_square);
if X1c>0 && Y1c>0 && 
    image([X1c:X2c],[Y1c:Y2c])=round_in_square;
end
% Right upper corner
round_in_square=flipud(round_in_square);
if X4c<=size(image,1) && Y1c>0 && 
    image([X3c:X4c],[Y1c:Y2c])=round_in_square;
end
image_out=image;

end

