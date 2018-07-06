format long
clear all
cover1=imread('eiffel.jpg');
[rw_c, col_c]=size(cover1);
logo1=imread('insta_logo.jpeg');
[rw_w, col_w]=size(logo1);
r1=3.9876;
r2=3.9999;
x0=0.89079;
y0=0.23342;
z0=0.5567;
q=0.4456;
cover_em=cover1;
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
        cpixel(k)=logo1(k1,k2);
        cp_em=uint8(bin2dec(num2str(cpixel)));
        cover_em(x_ind,y_ind)=cp_em;
%         cover_bin=dec2bin(cover_em(x_ind,y_ind),8);
%         % cover_bin=str2num(cover_bin);
%         cover_bin(k)=logo1(k1,k2)
%         % cover_bin=num2str(cover_bin);
%         cover_em(x_ind,y_ind)=bin2dec(cover_bin);
    end
end
cover_em=uint8(cover_em);
imwrite(cover_em,'eiffel1.jpg');
imwrite(cover_em,'eiffel2.jpg');
imshow(cover_em);
% isequal(cover1,cover_em)
psnr_val=psnr_fun(cover1,cover_em)
        
        

