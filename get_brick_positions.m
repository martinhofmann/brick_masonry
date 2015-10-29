function [ X,Y,n_bricks ] = get_brick_positions( size_image, L, h, e,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%% get_brick_positions %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will get all the bricks positions (the center of
% the bricks) given the dimensions of the picture and the dimensions of the
% bricks.
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - size_image   : Vector containing the size of the picture (1st
%                   coordinate is X and second is Y
%  - L            : Length of the bricks
%  - h            : Heigth of the bricks
%  - e            : Thickness of the mortar
%  - pix_size     : The pixel size (in mm!)
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - X            : Array containing the bricks X positions (in pixels
%                   coordinates)
%  - Y            : Array containing the bricks Y positions (in pixels
%                   coordinates)
%  - n_bricks     : The number of bricks
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computation of size of the offsets between the bricks

dy_brick=round(L/pix_size*1e3); % Longitudinal brick offset
d_mortar=round(e/pix_size*1e3); % Mortar offset 
dx_brick=round(h/pix_size*1e3); % Vertical brick offset

% First coordinates 

firstYuneven=round(-L/2/pix_size*1e3); % Uneven rows start with half a brick so the first coordinate is negative
firstYeven=1; % Even rows start with a whole brick


k=1; % Brick counter

count_row=1; % Row counter

posX=1; % Initialization of X position

while posX <= size_image(1)
    
    if mod(count_row,2) == 1
        posY=firstYuneven;
    else
        posY=firstYeven;
    end
    
    while posY<=size_image(2)
        X(k)=posX;
        Y(k)=posY;
        posY=posY+dy_brick+d_mortar
        k=k+1;
    end
    
    count_row=count_row+1;
    posX=posX+dx_brick+d_mortar;

end
n_bricks=k-1;
