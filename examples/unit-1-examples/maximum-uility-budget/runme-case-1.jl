# include the include -
include("Include.jl")

# initialize -
α = [0.55, 0.45]; # coefficients
c = [2.0, 4.0]; # price of x1 and x2

# build my problem object -
problem = build(MySimpleCobbDouglasChoiceProblem, (
    
    initial = 0.1*ones(2), # initial guess
    α = α, # coefficients
    c = c, # price of x1 and x2
    I = 100.0, # income
    
    # how much of x₁ and x₂ can be we buy?
    bounds = [
        0.0 100.0; # L U
        0.0 100.0; # L U
    ]
));

results = solve(problem);

# tests -
xopt = results["argmax"];
x1_opt = round(xopt[1]; sigdigits=6)
x2_opt = round(xopt[2]; sigdigits=6)
Ū₁ = α[1]*(x1_opt^(α[1]-1))*(x2_opt^(1-α[1]))
Ū₂ = (1-α[1])*(x1_opt^(α[1]))*(x2_opt^(-α[1]))
λ = Ū₁/c[1]
F1 = Ū₁ -λ*c[1]
F2 = Ū₂ -λ*c[2]
F3 = 100.0 - (c[1]*x1_opt + c[2]*x2_opt)
(F1,F2,F3)