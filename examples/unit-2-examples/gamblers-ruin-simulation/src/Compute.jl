function simulate(w::Float64; N::Int64 = 100, M::Int64 = 100)::Array{Float64,2}

    # initialize -
    data = Array{Float64,2}(undef, M, N);
    fill!(data,0.0); # fill up the data array w/0.0 -

    # build a Bernoulli distribution -
    d = Bernoulli(0.5);
    samples = rand(d, M, N)

    # simulation loop -
    for i ∈ 1:M # we have M players
        for j ∈ 2:N # each player doed N flips -
            
            flip = samples[i,j];
            if (flip == 1)
                data[i,j] = w + data[i,j-1]
            else
                data[i,j] = data[i,j-1] - w;
            end
        end
    end

    # return -
    return data
end