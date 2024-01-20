function y = alawcompand(x,a)
   x = max(-1/a,min(1/a,x));
   y = sign(x).*(a*abs(x))/(1+log(a));
end