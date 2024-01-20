function y = muLawCompand(x, mu)
    x = max(-1, min(1, x));
    y = sign(x) .* log(1 + mu * abs(x)) / log(1 + mu);
end
