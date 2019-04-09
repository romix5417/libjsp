module Jdft

println("DFT module init...")

function dft(n, fx, fsample)
    if n <= 0
        throw(DomainError(n, "sample points must be > 0.\r\n"))
    end

    if fsample <= 0
        throw(DomainError(fsample, "sample must be > 0.\r\n"))
    end

    X = zeros(complex(Float64),n) 

    for i = 0:n-1
        for j = 0:n-1
            X[i+1] += fx(j/fsample) * exp(-im * 2 * pi * j * i / n)
        end
    end

    return X
end

println("DFT module inited, continue loading module...")

end