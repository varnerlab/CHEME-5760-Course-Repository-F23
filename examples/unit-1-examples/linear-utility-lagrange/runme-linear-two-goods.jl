include("Include.jl")

# build the system array -
# set paramneters
c₁ = 0.1;
c₂ = 1.2;
a₁ = 0.5;
a₂ = 0.5;
I = 10.0;

A = [
    0 0 -c₁ ;
    0 0 -c₂ ;
    -c₁ -c₂ 0 ;
];

b = [
    -a₁ ;
    -a₂ ;
    -I ;
];

θ = pinv(A)*b