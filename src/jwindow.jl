function triangular_window(n)
    if iseven(n)
        W_f = range(0, stop = n/2 - 1)
        W_r = range(n/2, stop = n - 1)

        W_f = W_f/(n/2)
        W_r = -(W_r/(n/2)) .+ 2

        return vcat(W_f, W_r)
    else

    end
end

function hamming_window(n)

end

function hanning_window(n)

    W = range(0, stop=n-1)
    W = W .* 2 * pi / n
    W = -0.5 * broadcast(cos, W) .+ 0.5

    return W
end

function window(type, n)
    if type == "triangle"
        return triangular_window(n)
    elseif type == "hamming"
        return hamming_window(n)
    elseif type == "hanning"
        return hanning_window(n)
    end
end
