function [r,rl]=Reconstruction(tc,td,sampled_signal)
   r = zeros(1,length(tc));
for i=1:length(td)
    index=find(tc>=td(i),1,'first');
    r(index)=sampled_signal(i);
end
rl=interp1(td,sampled_signal,tc,'linear');
end