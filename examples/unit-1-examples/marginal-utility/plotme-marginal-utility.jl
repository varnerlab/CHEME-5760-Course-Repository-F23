# include -
include("Include.jl")

# define my utility functions -
U1(w) = log(1+w);
U2(w) = 0.002*w^2

# setup w -
warray = range(0.0,step=1.0,stop=100.0) |> collect
N = length(warray)

# evalue the derivatives -
marginal_utility_array = Array{Float64,2}(undef, N, 3);

# compute the utility_array -
for i ∈ 1:N

    # get w -
    wv = warray[i];

    # compute and store 
    marginal_utility_array[i,1] = wv
    marginal_utility_array[i,2] = ForwardDiff.derivative(U1,wv);
    marginal_utility_array[i,3] = ForwardDiff.derivative(U2,wv);
end

plot(marginal_utility_array[:,1], marginal_utility_array[:,2], lw=3, c=colors[1], label="MU Agent A", 
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
plot!(marginal_utility_array[:,1], marginal_utility_array[:,3], lw=3, c=colors[2], label="MU Agent B")
xlabel!("Widgets w (AU)", fontsize=18)
ylabel!("Marginal Utility (utils/widget)", fontsize=18)

# savefig -
savefig(joinpath(_PATH_TO_FIGS, "Fig-Marginal-Utility-Agents-Raw.pdf"))