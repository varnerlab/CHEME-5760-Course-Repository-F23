# setup paths -
const _ROOT = pwd()
const _PATH_TO_FIGS = joinpath(_ROOT, "figs")

# load external packages -
import Pkg; Pkg.activate("."); Pkg.instantiate();
using Symbolics
using Plots
using Colors
using Latexify
using Statistics
using LinearAlgebra

# load my codes -
# ...

# Setup color pallete -
colors = Dict{Int64,RGB}()
colors[1] = colorant"#EE7733";
colors[2] = colorant"#0077BB";
colors[3] = colorant"#33BBEE";
colors[4] = colorant"#EE3377";
colors[5] = colorant"#CC3311";
colors[6] = colorant"#009988";
colors[7] = colorant"#BBBBBB";