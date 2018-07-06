function[u2]=pwlcm(u1,p,itr)
%generates new chaotic variables after itr iterations
format long
for k=1:1:itr
    if (u1>0&&u1<p)
               u2=u1/p;           
        else
               u2=(1-u1)/(1-p);           
    end  
    u1=u2;
end