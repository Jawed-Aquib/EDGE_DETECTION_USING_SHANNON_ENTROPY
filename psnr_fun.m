
function[PSNR1]=psnr_fun(cover,cover_em)
clear all
format long
%hf1=imfinfo('lena256gr.png');
img1=imread('eiffel1.jpg');
img2=imread('gammacorrection.png');
%img1=cover;
%img2=cover_em;
[M, N]=size(img1);
diff=0;
k=1;
for k2=1:1:N
        for k3=1:1:M            
            diff(k)=img2(k2,k3)-img1(k2,k3);
            k=k+1;
            end % end of inner most for loop k3
    end % end of inner for loop k2
 
diff=diff.^2;
disp('Mean Square Error(MSE) is')
MSE=sum(diff)/(M*N);
disp(MSE)
disp('Peak Signal to Noise Ratio(PSNR) is')

PSNR1=20*log10(255/(sqrt(MSE)));
disp(PSNR1)
disp(' dB')

