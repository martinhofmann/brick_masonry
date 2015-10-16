clear all;
close all;
clc;

tic;

init_params_brick_masonry;

masonry_picture=draw_masonry(length_pic,height_pic,L,h,e,r,pix_size);

toc; 

imshow(masonry_picture);
