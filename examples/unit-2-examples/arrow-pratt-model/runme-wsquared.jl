# include packages -
using ForwardDiff

# define the utility function U(w), and its derivative U'(w) -
U(w) = 0.001*w^2

# setup the wealth range -
wealth_array = 1.0:1.0:100.0 |> collect;
number_of_points = length(wealth_array);

# main: compute the utility, and risk aversion for each wealth value -
risk_aversion_array = Array{Float64,2}(undef, number_of_points, 4);
for i ∈ 1:number_of_points
    
    # grab the wealth from the wealth array -
    w = wealth_array[i];

    # compute the risk aversion -
    D1 = ForwardDiff.derivative(U, w);
    D2 = ForwardDiff.derivative(x -> ForwardDiff.derivative(U, x), w)

    # store data -
    risk_aversion_array[i,1] = w;           # 1 wealth
    risk_aversion_array[i,2] = U(w);        # 2 utility
    risk_aversion_array[i,3] = -(D2/D1);    # 3 risk aversion (absolute))
    risk_aversion_array[i,4] = -w*(D2/D1);  # 4 risk aversion (relative)
end