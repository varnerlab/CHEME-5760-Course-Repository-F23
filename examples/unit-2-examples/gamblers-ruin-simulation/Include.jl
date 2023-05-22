# paths -
const _ROOT = pwd();
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_FIGS = joinpath(_ROOT, "figs")

# load packages -
using Distributions
using Plots
using Colors
using Statistics

# load my codes -
include(joinpath(_PATH_TO_SRC, "Compute.jl"))