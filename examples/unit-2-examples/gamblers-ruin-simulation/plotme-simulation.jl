# include -
include("Include.jl")

# Colors taken from: https://personal.sron.nl/~pault/
colors = Dict{Int64,RGB}()
colors[1] = colorant"#0077BB" 
colors[2] = colorant"#33BBEE"
colors[3] = colorant"#009988"
colors[4] = colorant"#EE7733"
colors[5] = colorant"#CC3311"
colors[6] = colorant"#EE3377" 
colors[7] = colorant"#BBBBBB"

# run the simulation -
wₒ = 1.0; # what we are willing to risk
N = 1000; # number of flips -
M = 100;  # number of players
data = simulate(wₒ; N = N, M = M);

# compute the mean and std -
μ = mean(data, dims=1);
σ = std(data, dims=1);

# compute -
L = μ .- σ;
U = μ .+ σ;

# plot -
plot(transpose(data), label="", linetype=:steppre, c=colors[2], lw=0.5,
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
plot!(1:N, μ', lw=3, c=colors[5], label="mean (N = $(N), M = $(M))");
plot!(1:N, μ', lw=3, fillrange=U', fillalpha = 0.4, c=colors[5], label="");
plot!(1:N, μ', lw=3, fillrange=L', fillalpha = 0.4, c=colors[5], label="");
xlabel!("Flip index", fontsize=18);
ylabel!("Cumulative Reward (USD)", fontsize=18);

# save fig -
savefig(joinpath(_PATH_TO_FIGS, "Fig-CoinFlip-Game-Simulation-Range.pdf"))