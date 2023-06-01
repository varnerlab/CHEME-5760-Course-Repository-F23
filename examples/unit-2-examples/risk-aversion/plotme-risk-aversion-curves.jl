# include -
include("Include.jl")


# compute risk neutral parameters -
Y = [0 ; 3];
X = [1 0; 1 50]
# θ = inv(transpose(X)*X)*transpose(X)*Y
θ = inv(X)*Y

# setup utility function -
URA(x) = log(x+1)
URS(x) = 0.0004698673604734211*x^2
URN(x) = θ[1]+θ[2]*x

# setup scale -
number_of_points = 100
warray = 0:1:number_of_points |> collect

# compute -
utility_array = Array{Float64,2}(undef,number_of_points,3)
for i ∈ 1:number_of_points

    # get x, and compute the utility
    w = warray[i];
    Uᵢ = URS(w);

    # capture the utility
    utility_array[i,1] = w;
    utility_array[i,2] = Uᵢ
end

Umax = utility_array[end,2];
Umin = utility_array[1,2];

# scale -
for i ∈ 1:number_of_points
    
    Uᵢ = utility_array[i,2]
    utility_array[i,3] = (Uᵢ - Umin)/(Umax-Umin)
end


# plot -
plot(utility_array[:,1],  utility_array[:,3], lw=4, label="", c=colors[2], 
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
xlabel!("Wealth W (AU)", fontsize=18)
ylabel!("Utility (utils)", fontsize=18)

# save -
savefig(joinpath(_PATH_TO_FIGS, "Fig-RiskSeeking-Panel.pdf"))