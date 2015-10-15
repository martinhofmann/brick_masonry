clear all;
close all;
clc;

init_params_brick_masonry;



void_picture=create_picture(length_pic,height_pic,pix_size);

masonry_picture=draw_masonry(void_picture,L,h,e,r,pix_size)

imshow(masonry_picture);
