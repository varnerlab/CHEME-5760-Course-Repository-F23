# include the include -
include("Include.jl")

# build my problem object -
problem = build(MySimpleCobbDouglasChoiceProblem, (
    
    initial = 0.1*ones(2), # initial guess
    α = [0.55, 0.45], # coefficients
    c = [2.0, 4.0], # price of x1 and x2
    I = 150.0, # income
    
    # how much of x₁ and x₂ can be we buy?
    bounds = [
        0.0 100.0; # L U
        0.0 100.0; # L U
    ]
));

results = solve(problem);