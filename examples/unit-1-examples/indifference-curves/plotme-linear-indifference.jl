include("Include.jl")

# initialize -
α = [0.5, 1.0]; # coefficients

# build my model object -
model = build(MyLinearUtilityFunction, (
    parameters = α,
));


p = plot();
utility = [80.0, 100.0, 120.0];
number_of_points = 100;
for u ∈ utility
    dependent = range(0.0,u/α[1], length=number_of_points) |> collect |> x -> reshape(x, number_of_points, 1);
    
    # solve
    solution = indifference(model, utility=u, dependent=dependent);
    plot!(solution[:,1], solution[:,2], label="U: $(u) utils", lw=3, 
        bg=:snow2, background_color_outside="white", framestyle = :box, fg_legend = :transparent)
end
xlabel!("Good or Service 1 (units)", fontsize=18);
ylabel!("Good or Service 2 (units)", fontsize=18);
current()

# save -
savefig(joinpath(_PATH_TO_FIGS, "Fig-Indifference-Curves-Linear.svg"))