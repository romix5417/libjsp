include("../src/jdft.jl")

import .Jdft
using Plots

function fx(t)
    sin(2*pi*1000*t) + 0.5*sin(2*pi*2000*t + 3*pi/4)
end

fsample = 8000

X = Jdft.dft(8, fx, fsample)

#=
for i = 1:64
    #println(fx((i-1)/fsample))
    println("X[$(i-1)] = $(X[i]) abs = $(abs(X[i]))")
end
=#

x = range(0, stop=7)
y = broadcast(abs,X)

println(x)
println(y)

display(plot(x, y))