function [ picture_out ] = place_brick( brick_image,posX,posY,L,h,picture_in,pix_size )

length=size(brick_image,1);
heigth=size(brick_image,2);

posXc=posX/pix_size*1e3+1;
posYc=posY/pix_size*1e3+1;

x1=posX-h/2;
x2=posX+h/2;
y1=posY-L/2;
y2=posY+L/2;

x1c=round(x1/pix_size*1e3)+1;
y1c=round(y1/pix_size*1e3)+1;

x2c=round(x2/pix_size*1e3)+1;
y2c=round(y2/pix_size*1e3)+1;

tcx1=0;
tcy1=0;
tcx2=0;
tcy2=0;

if x1c<=0;
    tcx1=abs(x1c)+1;
end

if y1c<=0;
    tcy1=abs(y1c)+1;
end

if x2c>size(picture_in,1)
    tcx2=x2c-size(picture_in,1);
end

if y2c>size(picture_in,2)
    tcy2=y2c-size(picture_in,2);
end


if tcx1~=0
    brick_image(1:tcx1,:)=[];
    posXc=round(posXc+tcx1/2);
    x1c=1;
end

if tcy1~=0
    brick_image(:,1:tcy1)=[];
    posYc=round(posYc+tcy1/2);
    y1c=1;
end

if tcx2~=0
    brick_image(size(brick_image,1)-tcx2+1:end,:)=[];
    posXc=round(posXc-tcx2/2);
    x2c=size(picture_in,1);
end

if tcy2~=0
    brick_image(:,size(brick_image,2)-tcy2+1:end)=[];
    posYc=round(posYc-tcy2/2);
    y2c=size(picture_in,2);
end


picture_out=picture_in;
picture_out(x1c:x2c,y1c:y2c)=brick_image;


end

