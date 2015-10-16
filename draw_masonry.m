function [ masonry_pic ] = draw_masonry( void_picture,L,h,e,r,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%% get_brick_positions %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will get all the bricks positions (the center of
% the bricks) given the dimensions of the picture and the dimensions of the
% bricks.
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - void_picture : The empty picture (completely white)
%  - L            : The length of the bricks in meters
%  - h            : The heigth of the bricks in meters
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

[X_pos,Y_pos,n_bricks]=get_brick_positions(size(void_picture,1)/pix_size/1e3,size(void_picture,2)/pix_size/1e3,L,h,e);
masonry_pic=void_picture;
image_brick=draw_brick(L,h,r,pix_size);

for k=1:n_bricks
    masonry_pic=place_brick(image_brick,X_pos(k),Y_pos(k),L,h,masonry_pic,pix_size);
end

