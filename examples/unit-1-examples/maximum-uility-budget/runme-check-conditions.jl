# specify parameters (and solution) from the problem
α, c₁, c₂, x₁, x₂, I = 0.55, 2.0, 4.0, 27.5, 11.25, 100.0

# compute the marginal utility at the optimum -
Ū₁ = α*(x₁^(α-1))*(x₂^(1-α))
Ū₂ = (1-α)*(x₁^(α))*(x₂^(-α))

# compute the Lagrange multiplier -
λ = Ū₁/c₁;

# Compute the first-order conditions -
E1 = Ū₁ - λ*c₁
E2 = Ū₂ - λ*c₂
E3 = I - (c₁*x₁ + c₂*x₂)

# print -
println("First-order optimality conditions: $(E1), $(E2), $(E3)")