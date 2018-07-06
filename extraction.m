format long
clear all
cover_em=imread('cover_em.png');
[rw_c, col_c]=size(cover_em);
% logo1=imread('barbw.png');
% [rw_w, col_w]=size(logo1);
rw_w=200;
col_w=200;
logo1=uint8(zeros(rw_w, col_w));
r1=3.9876;
r2=3.9999;
x0=0.89079;
y0=0.23342;
z0=0.5567;
q=0.4456;
% cover1=cover_em;
% logo1=double(logo1);
% logo1=int2str(logo1);
% rw_w=10;
% col_w=10;
for k1=1:1:rw_w
    for k2=1:1:col_w
        x1=r1*x0*(1-x0);
        y1=r2*y0*(1-y0);
        x0=x1;
        y0=y1;
        z1=pwlcm(z0,q,1);
        z0=z1;
        x_ind=1+mod(floor(x1*rw_c),rw_c);
        y_ind=1+mod(floor(y1*col_c),col_c);
        if ((0<z1)&&(z1<0.25))
            k=3;
        elseif ((0.25<=z1)&&(z1<0.5))
            k=4;
        elseif ((0.5<=z1)&&(z1<0.75))
            k=5;
        else
            k=6;
        end
        cbin=fi(cover_em(x_ind,y_ind),0,8,0);
        cpixel=(uint8(bin(cbin))-48);
        logo1(k1,k2)=cpixel(k);
%         cp_em=uint8(bin2dec(num2str(cpixel)));
%         cover_em(x_ind,y_ind)=cp_em;
%         cover_bin=dec2bin(cover_em(x_ind,y_ind),8);
%         % cover_bin=str2num(cover_bin);
%         cover_bin(k)=logo1(k1,k2)
%         % cover_bin=num2str(cover_bin);
%         cover_em(x_ind,y_ind)=bin2dec(cover_bin);
        clear cbin cpixel 
    end
end
logo1=uint8(logo1);
logo1=logo1*255;
imwrite(logo1,'logo_ext.png');
imshow(logo1);
% isequal(cover1,cover_em)
% psnr_val=psnr_fun(cover1,cover_em)
        
        

