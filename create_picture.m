function [ pic_out ] = create_picture(length,heigth,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%%%% create_picture %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : function that will create a picture according to its length
% (X), its height (Y) and the pixel size. 
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - length        : Length(horizontal dimension) of the picture in meters
%  - heigth        : Heigth(vertical dimension) of the picture in meters
%  - pix_size  : Pixel size in MILLIMETERS
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - pic_out   : an NxM matrix corresponding to the picture
%
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M=round(heigth/pix_size*1e3);
N=round(length/pix_size*1e3);
pic_out=ones(M,N); % Assigning ones gives a white picture

end

