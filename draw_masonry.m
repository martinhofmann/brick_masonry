function [ masonry_pic ] = draw_masonry(length_pic,heigth_pic,L,h,e,r,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%% get_brick_positions %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will get all the bricks positions (the center of
% the bricks) given the dimensions of the picture and the dimensions of the
% bricks.
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - length_pic   : The length of the picture (in meters)
%  - heigth_pic   : The heigth of the picture (in meters)
%  - L            : The length of the bricks (in meters)
%  - h            : The heigth of the bricks (in meters)
%  - e            : The thickness of the mortar in meters
%  - r            : The radius of the corners of the bricks in meters
%  - pix_size     : The pixel size in milimeters
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - masonry_pic  : The picture drawn with all the bricks
%
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Creation of the empty picture

masonry_pic=create_picture(length_pic,heigth_pic,pix_size);

% We get the positions of the bricks with the function get_brick_positions

[X_pos,Y_pos,n_bricks]=get_brick_positions(size(masonry_pic),L,h,e,pix_size);


% Creation of the brick image that will be repeated all over masonry_pic

image_brick=draw_brick(L,h,r,pix_size);

% For each brick, we place it with the mason function place_brick

for k=1:n_bricks
    masonry_pic=place_brick(image_brick,X_pos(k),Y_pos(k),masonry_pic,pix_size);
end

