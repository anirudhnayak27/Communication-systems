function y = muLawExpand(x, mu)
    y = sign(x) .* (1 / mu) .* ((1 + mu) .^ abs(x) - 1);
end
