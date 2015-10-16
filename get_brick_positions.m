function [ X,Y,n_bricks ] = get_brick_positions( dim_image_X, dim_image_Y, L, h, e )
%% %%%%%%%%%%%%%%%%%%%%%%%% get_brick_positions %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% fonction : Function that will get all the bricks positions (the center of
% the bricks) given the dimensions of the picture and the dimensions of the
% bricks.
%
% %%%%%% usage %%%%%%
% %% INPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - dim_image_X  : Vertical dimension of the picture (in m)
%  - dim_image_Y  : Horizontal dimension of the picture (in m)
%  - L            : Length of the bricks
%  - h            : Heigth of the bricks
%  - e            : Thickness of the mortar
%
% %% OUTPUTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  - X            : Array containing the bricks X positions
%  - Y            : Array containing the bricks Y positions
%  - n_bricks     : The number of bricks
%
% %% AUTEUR : Martin HOFMANN
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Computation of the X coordinates

% uneven rows : the first brick has its center in X = 0 (half of it is out
% of the picture)

X(1)=0;

% The number of bricks on an uneven row is determined by the following formula 

n_bricks_y_uneven=floor((dim_image_Y+L/2)/(L+e)+1);

% The number of bricks on an even row is determined by the following
% formula

n_bricks_y_even=floor((dim_image_Y+L/2)/(L+e)+1/2);

% The number of rows is determined by the following formula :

n_rows=floor(dim_image_X/(h+e)+1);

k=1;
for n=1:n_rows
    if mod(n,2)==1
        for m=1:n_bricks_y_uneven
            Y(k)=(m-1)*(L+e);
            X(k)=h/2+(n-1)*(h+e);
            k=k+1;
        end
    else
        for m=1:n_bricks_y_even
            Y(k)=(m-1/2)*(L+e);
            X(k)=h/2+(n-1)*(h+e);
            k=k+1;
        end
    end
end

n_bricks=k-1;

end

