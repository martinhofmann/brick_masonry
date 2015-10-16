function [ pic_out ] = create_picture( X,Y,pix_size )
%% %%%%%%%%%%%%%%%%%%%%%%%%%% create_picture %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : function that will create a picture according to its length
% (X), its height (Y) and the pixel size. 
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - X         : Length (horizontal dimension) of the picture in meters
%  - Y         : Heigth (vertical dimension) of the picture in meters
%  - pix_size  : Pixel size in MILLIMETERS
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - pic_out   : an NxM matrix corresponding to the picture
%
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M=round(X/pix_size*1e3);
N=round(Y/pix_size*1e3);
pic_out=ones(M,N); % Assigning ones gives a white picture

end

