close all
   clear 
   clc % just to clear things up
   I=imread('eiffel1.jpg');
   J = imnoise(I,'salt & pepper',0.02);
   imwrite(J,'noise.jpg');
   imshow('rgb.jpg');
   