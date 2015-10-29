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

% Computing the coordinates of the center on the picture

x1=posX;
x2=posX+size(brick_image,1)-1;
y1=posY;
y2=posY+size(brick_image,2)-1;

if x1<1
    brick_image(1:abs(x1)+1,:)=[];
    x1=1;
end

if x2>size(picture_in,1)
    brick_image(size(brick_image,1)-x2+size(picture_in,1)+1:end,:)=[];
    x2=size(picture_in,1);
end

if y1<1
    brick_image(:,1:abs(y1)+1)=[];
    y1=1;
end

if y2>size(picture_in,2)
    brick_image(:,size(brick_image,2)-y2+size(picture_in,2)+1:end)=[];
    y2=size(picture_in,2);
end

picture_in(x1:x2,y1:y2)=brick_image;

picture_out=picture_in;

end

