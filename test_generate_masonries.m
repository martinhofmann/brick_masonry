clear all;
close all;
clc;
addpath('X:\programmation_files\interlocking');

init_params_brick_masonry;

k=1;

for L=0.15:0.05:0.35

masonry_picture=draw_masonry(length_pic,height_pic,L,h,e,r,pix_size);
I=get_interlocking_formula(r,h,L,e);
subplot(3,5,k)
imshow(masonry_picture);
title( ['L= ' num2str(L) ' m'] )
xlabel(['Interlck= ' num2str(I) ]);
hold on;
k=k+1;

end;

L=0.25;
% k=1;
% figure;
for h=0.04:0.01:0.08

masonry_picture=draw_masonry(length_pic,height_pic,L,h,e,r,pix_size);
I=get_interlocking_formula(r,h,L,e);
subplot(3,5,k)
imshow(masonry_picture);
title( ['h= ' num2str(h) ' m'] )
xlabel(['Interlck= ' num2str(I)] );
hold on;
k=k+1;

end;
h=0.06;
% k=1;
% figure;
for r=0.00:0.01:0.03

masonry_picture=draw_masonry(length_pic,height_pic,L,h,e,r,pix_size);
I=get_interlocking_formula(r,h,L,e);
subplot(3,5,k)
imshow(masonry_picture);
title( ['r= ' num2str(r) ' m'] )
xlabel(['Interlck= ' num2str(I) ]);
hold on;
k=k+1;

end;