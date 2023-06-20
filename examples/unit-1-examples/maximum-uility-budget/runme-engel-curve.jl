# include the include -
include("Include.jl")

# setup budget contraint -
I_values = range(10.0,step=10.0,stop=1000.0) |> collect;
number_of_budget_constraints = length(I_values);
solution_array = Array{Float64,2}(undef, number_of_budget_constraints, 4);

# initialize -
α = [0.55, 0.45]; # coefficients
c = [2.0, 4.0]; # price of x1 and x2

for i ∈ 1:number_of_budget_constraints

    # what value of income are we using?
    I_value = I_values[i];

    # build new problem object -
    problem = build(MySimpleCobbDouglasChoiceProblem, (
    
        initial = 0.1*ones(2), # initial guess
        I = I_value, # income
        α = α, # coefficients
        c = c, # price of x1 and x2
    
        # how much of x₁ and x₂ can be we buy?
        bounds = [
            0.0 I_value/c[1]; # L U
            0.0 I_value/c[2]; # L U
        ]
    ));

    # solve -
    results = solve(problem);
    Uopt = round(results["objective_value"], sigdigits=4);
    xopt = results["argmax"];
    x1_opt = round(xopt[1]; sigdigits=3)
    x2_opt = round(xopt[2]; sigdigits=3)

    # package -
    solution_array[i,1] = I_value;
    solution_array[i,2] = x1_opt;
    solution_array[i,3] = x2_opt;
    solution_array[i,4] = Uopt;
end
