function [ picture_out ] = place_brick( brick_image,posX,posY,L,h,picture_in,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%%%%% place_brick %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will place the brick in the correct place on the
% picture, according to its coordinates and its image. It will also cut the
% parts that can be outside of the picture
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - brick_image  : A matrix containing the image of the brick
%  - pos_X        : The X coordinate of the center of the brick (m)
%  - pos_Y        : The Y coordinate of the center of the brick (m)
%  - L            : The length of the brick (m)
%  - h            : The heigth of the brick (m)
%  - picture_in   : The input picture, on which the function will place the
%                   brick
%  - pix_size     : The pixel size in mm
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - picture_out  : The picture with the brick added on it.
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Getting the dimensions of the brick picture

length=size(brick_image,1);
heigth=size(brick_image,2);

% Computing the coordinates of the center on the picture

posXc=posX/pix_size*1e3+1;
posYc=posY/pix_size*1e3+1;

% Computing the coordinates of the corners of the brick picture in meters

x1=posX-h/2;
x2=posX+h/2;
y1=posY-L/2;
y2=posY+L/2;

% Computing the coordinates of the corners of the brick pictures on the
% global picture

x1c=round(x1/pix_size*1e3)+1;
y1c=round(y1/pix_size*1e3)+1;

x2c=round(x2/pix_size*1e3)+1;
y2c=round(y2/pix_size*1e3)+1;

% These variables represent the number of pixels that will be cutted on the
% brick picture on each side if necessary and are initialized at 0. tcx1 is
% the upper part that could be cutted, tcy1 is the left part, tcx2 the
% lower part and tcy2 the right part.

tcx1=0;
tcy1=0;
tcx2=0;
tcy2=0;

% We compute the values of these variables if one of the side of the brick
% picture is outside of the global picture

% Upper part:
if x1c<=0;
    tcx1=abs(x1c)+1;
end

% Left part:
if y1c<=0;
    tcy1=abs(y1c)+1;
end

% Lower part:
if x2c>size(picture_in,1)
    tcx2=x2c-size(picture_in,1);
end

% Right part:
if y2c>size(picture_in,2)
    tcy2=y2c-size(picture_in,2);
end


% If these values are not 0, we cut the brick image and reassign its center
% on the global picture. 

% Upper part:
if tcx1~=0
    brick_image(1:tcx1,:)=[]; % Cutting the brick picture
    x1c=1; % Reassigning upper coordinate
end

% Left part:
if tcy1~=0
    brick_image(:,1:tcy1)=[]; % Cutting the brick picture
    y1c=1; % Reassigning left coordinate
end

% Lower part:
if tcx2~=0
    brick_image(size(brick_image,1)-tcx2+1:end,:)=[]; % Cutting the brick picture
    x2c=size(picture_in,1); % Reassigning lower coordinate
end

% Right part:
if tcy2~=0
    brick_image(:,size(brick_image,2)-tcy2+1:end)=[]; % Cutting the brick picture
    y2c=size(picture_in,2); % Reassigning right coordinate
end

% Assigning the out picture

picture_out=picture_in;

% Putting the brick picture on the global picture

picture_out(x1c:x2c,y1c:y2c)=brick_image;


end

