function [ picture_out ] = place_brick( brick_image,posX,posY,picture_in,pix_size )
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
%  - picture_in   : The input picture, on which the function will place the
%                   brick
%  - pix_size     : The pixel size in mm
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - picture_out  : The picture with the brick added on it.
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computing the coordinates of the brick picture in the global picture

x1=posX; % up X coordinate
x2=posX+size(brick_image,1)-1; % down X coordinate
y1=posY; % left Y coordinate
y2=posY+size(brick_image,2)-1; % right Y coordinate

% If the brick is to high
if x1<1
    brick_image(1:abs(x1)+1,:)=[]; % We cut the upper part of the brick picture
    x1=1; % We re-asign the top coordinate with 1
end

%If the brick is too low 
if x2>size(picture_in,1)
    brick_image(size(brick_image,1)-x2+size(picture_in,1)+1:end,:)=[]; % We cut the lower part of the brick picture
    x2=size(picture_in,1); % We re-asign the lower coordinate with the end of the global picture
end

% If the brick is too left
if y1<1 
    brick_image(:,1:abs(y1)+1)=[]; % We cut the left part of the brick picture
    y1=1; % We re-asign the left coordinate with 1
end

% If the brick is too right
if y2>size(picture_in,2)
    brick_image(:,size(brick_image,2)-y2+size(picture_in,2)+1:end)=[]; % We cut the right part of the brick
    y2=size(picture_in,2); % We re-asign the left coordinate with the end of the global picture
end

% We put the brick picture on the picture given as an input
picture_in(x1:x2,y1:y2)=brick_image;

% The output is assigned
picture_out=picture_in;

end

