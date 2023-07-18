abstract type AbstractUtilityFunctionType end

mutable struct MyLinearUtilityFunction <: AbstractUtilityFunctionType
   
    # data -
    parameters::Union{Nothing, Array{Float64,1}} # parameters -

    # constructor -
    MyLinearUtilityFunction() = new()
end

mutable struct MyCobbDouglasUtilityFunction <: AbstractUtilityFunctionType
   
    # data -
    parameters::Union{Nothing, Array{Float64,1}} # parameters -

    # constructor -
    MyCobbDouglasUtilityFunction() = new()
end

mutable struct MyLeontiefUtilityFunction <: AbstractUtilityFunctionType
   
    # data -
    parameters::Union{Nothing, Array{Float64,1}} # parameters -

    # constructor -
    MyLeontiefUtilityFunction() = new()
end