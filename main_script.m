clear all;
close all;
clc;

init_params_brick_masonry.m;

void_picture=create_image(X,Y,pix_size);

masonry_picture=draw_masonry(void_picture,L,h,e,r,pix_size)


