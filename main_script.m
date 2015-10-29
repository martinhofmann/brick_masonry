clear all;
close all;
clc;
addpath('X:\programmation_files\interlocking')

tic;

init_params_brick_masonry;

masonry_picture=draw_masonry(length_pic,height_pic,L,h,e,r,pix_size);

toc; 

% masonry_picture(:,1)=[];
imshow(masonry_picture);
hold on;
% [interlocking_astar, Optimal_path]=get_interlocking_astar(masonry_picture);
% interlocking_formula=get_interlocking_formula(r,h,L,e);


