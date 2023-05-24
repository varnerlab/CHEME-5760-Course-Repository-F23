# include -
include("Include.jl")

# declare variables (symbols in the eqn)
@variables x, a

# Build differential operator for x -
Dₓ = Differential(x);
Dₓₓ = Differential(x)^2;

# define the utility function
U = a*x^2

# compute the derivative -
∂Uₓ = Dₓ(U) |> expand_derivatives;
∂Uₓₓ = Dₓₓ(U) |> expand_derivatives;
r = - (Dₓₓ(U)/Dₓ(U)) |> expand_derivatives;

# print -
println("The value of ∂U/∂x = ",∂Uₓ," and ∂2U/∂x2 = ", ∂Uₓₓ)