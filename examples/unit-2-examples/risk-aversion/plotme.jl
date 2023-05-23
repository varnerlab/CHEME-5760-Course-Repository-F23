# include -
include("Include.jl")

# setup scale -
w = 1:1:100 |> collect

# compute u -
U = exp.(0.01*w);
Umin = minimum(U)
Umax = maximum(U);
u = (U .- Umin)./(Umax - Umin);