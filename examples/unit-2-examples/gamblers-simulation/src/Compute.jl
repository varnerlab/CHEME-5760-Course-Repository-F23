function simulate(w::Float64; N::Int64 = 100, M::Int64 = 100)::Array{Float64,2}

    # initialize -
    data = Array{Float64,2}(undef, M, N); # holds the simulation results
    fill!(data,0.0); # fill up the data array w/0.0 -

    # build a Bernoulli distribution, and sample it
    p = 0.5;
    flips = rand(Bernoulli(p), M, N)

    # simulation loop -
    for i ∈ 1:M # we have M players
        for j ∈ 2:N # each player does N flips -
            
            # grab a flip for player i and trial j -
            flip = flips[i,j];

            if (flip == 1) # heads
                data[i,j] = w + data[i,j-1]  # add w to current balance
            else
                data[i,j] = data[i,j-1] - w; # substract w from current balance
            end
        end
    end

    # return -
    return data
end