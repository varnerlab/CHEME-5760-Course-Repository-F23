# A model for the satisifcation from making a cheese sandwich

# load external packages -
include("Include.jl")

# initialize -
max_number_of_bread_slices = 4;
max_number_of_cheese_slices = 4;
bread_array = range(0,max_number_of_bread_slices,step=1) |> collect;
cheese_array = range(0,max_number_of_cheese_slices,step=1) |> collect;
HMA = Array{Float64}(undef, length(bread_array), length(cheese_array));
df = DataFrame();

# # build a utility function model -
model = build(VLLeontiefUtilityFunction, (
    α = [2.0, 1.0], # parameters: bread, cheese
));

# main -
for i ∈ eachindex(bread_array)
    
    # get the number of bread slices -
    number_of_bread_slices = bread_array[i];
    
    for j ∈ eachindex(cheese_array)

        # get the number of cheese slices -
        number_of_cheese_slices = cheese_array[j];
        
        # compute -
        value = evaluate(model, [number_of_bread_slices, number_of_cheese_slices]);

        # package -
        results_tuple = (
            bread = number_of_bread_slices,
            cheese = number_of_cheese_slices,
            U = value
        );
        push!(df, results_tuple);

        HMA[i,j] = value;
    end
end

# df |> markdown_table(String) |> clipboard