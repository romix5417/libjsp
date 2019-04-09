include("../src/libjsp.jl")

import .Libjsp
using Plots

function fx(t)
    sin(2*pi*5500*t) + 0.5*sin(2*pi*2300*t + 3*pi/4) + 0.8*cos(2*pi*8150*t + 2*pi/7)
end

fsample = 24000
sampling_num = 256

ts = 1/fsample

x_n = zeros(Float64,sampling_num)

for i_sampling=0:sampling_num-1
    x_n[i_sampling+1] = fx(ts*i_sampling)
end

trangle_window = Libjsp.window("hanning", sampling_num)

x_window = x_n .* trangle_window

X_n = Libjsp.dft(sampling_num, x_window, fsample)

x0 = range(0, stop=sampling_num-1)

y0 = x_n.^2
y0 = 10 * broadcast(log10, y0)

y1 = x_window

y2 = broadcast(abs, X_n)
y2 = 10 * broadcast(log10, y2)

p0 = plot(x0, y0, marker = 2, linecolor= :blue)
p1 = plot(x0, y1, marker = 2, linecolor= :green)
p2 = plot(x0, y2, marker = 3, linecolor= :red)

plot(p0, p1, p2, layout=(3,1))
