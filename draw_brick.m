function [ image_brick ] = draw_brick( L,h,r,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%%%%% draw_brick %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will draw a brick according to its position
% (X,Y), its length (L), its height (h), the radius of the corners (r) and
% an existing image. The function will return the image with the new brick
% added on it. The brick is drawn in grey (0.5) and the outline in black. 
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - L          : Length of the brick
%  - h          : Height of the brick
%  - r          : Radius of the corners of the brick
%  - pix_size   : Size of the pixels
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - image_out  : Image with the brick added on it
%
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


X1=0;
X2=X1+r;
X3=X2+h-2*r;
X4=X3+r;

Y1=0;
Y2=Y1+r;
Y3=Y2+L-2*r;
Y4=Y3+r;




% Determination of the coordinates of the corners


X1c=round(X1/pix_size*1e3)+1;
X2c=round(X2/pix_size*1e3)+1;
X3c=round(X3/pix_size*1e3)+1;
X4c=round(X4/pix_size*1e3)+1;

Y1c=round(Y1/pix_size*1e3)+1;
Y2c=round(Y2/pix_size*1e3)+1;
Y3c=round(Y3/pix_size*1e3)+1;
Y4c=round(Y4/pix_size*1e3)+1;

image_brick=ones(X4c,Y4c);


% Upper & lower parts

image_brick(X1c,Y2c:Y3c)=0;
image_brick(X4c,Y2c:Y3c)=0;

% Left and right parts

image_brick(X2c:X3c,Y1c)=0;
image_brick(X2c:X3c,Y4c)=0;




round_in_square=ones(X4c-X3c+1,Y4c-Y3c+1);
for i=0:pi/2/50:pi/2
    y=r*cos(i);
    x=r*sin(i);
    round_in_square(max(1,round(x/pix_size*1e3)),max(1,round(y/pix_size*1e3)))=0;
end


% Right lower corner

    image_brick([X3c:X4c],[Y3c:Y4c])=round_in_square;
% Left lower corner
round_in_square=flipud(round_in_square);
    image_brick([X1c:X2c],[Y3c:Y4c])=round_in_square;
% Left upper corner
round_in_square=fliplr(round_in_square);
    image_brick([X1c:X2c],[Y1c:Y2c])=round_in_square;
% Right upper corner
round_in_square=flipud(round_in_square);
    image_brick([X3c:X4c],[Y1c:Y2c])=round_in_square;


end

