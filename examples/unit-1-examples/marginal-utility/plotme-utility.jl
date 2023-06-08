# include -
include("Include.jl")

# define my utility functions -
U1(w) = log(1+w);
U2(w,a) = a*w^2

# setup w -
warray = range(0.0,step=1.0,stop=100.0) |> collect
N = length(warray)

# initialize -
utility_array = Array{Float64,2}(undef, N, 3);

# compute the utility_array -
a = 0.002;
for i ∈ 1:N

    # get w -
    w = warray[i];

    # compute and store 
    utility_array[i,1] = w
    utility_array[i,2] = U1(w)
    utility_array[i,3] = U2(w,a)
end

# make plots -
plot(utility_array[:,1],utility_array[:,2], lw=3, c=colors[1], label="Agent A", 
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
plot!(utility_array[:,1],utility_array[:,3], lw=3, c=colors[2], label="Agent B")
xlabel!("Widgets w (AU)", fontsize=18)
ylabel!("Utility U(w) (utils)", fontsize=18)

# savefig -
savefig(joinpath(_PATH_TO_FIGS, "Fig-Utility-Agents-Raw.pdf"))