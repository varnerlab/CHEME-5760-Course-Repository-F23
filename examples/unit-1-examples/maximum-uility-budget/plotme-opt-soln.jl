# include -
include("Include.jl")

# run case -
include("runme-case-1.jl"); # super hack ... but it works

# setup colors 
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#88CCEE"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#CC3311"

# ok, let's grab the results dictionary, and the Uopt -
Uopt = round(results["objective_value"], sigdigits=4);
xopt = results["argmax"];
c = problem.c;
budget_value = problem.I;
xlim = [0.0, 1.1*(budget_value/c[1])];
ylim = [0.0, 1.1*(budget_value/c[2])];
x1_opt = round(xopt[1]; sigdigits=3)
x2_opt = round(xopt[2]; sigdigits=3)

# compute the indifference curve -
INC = indifference(problem, Uopt, xlim)

# compute the budget -
BC = budget(problem, xlim)

# make the plots -
plot!(INC[:,1],INC[:,2],label="", lw=3, c=colors[1],
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent);
plot!(BC[:,1],BC[:,2], label="Budget $(budget_value)", lw=3,c=colors[4], xlim = xlim, ylim = ylim)
scatter!([xopt[1]], [xopt[2]], ms=4, c="white", mec=colors[1], label="")
xlabel!("Units of Good or Service 1 Consumed", fontsize=18)
ylabel!("Units of Good or Service 2 Consumed", fontsize=18)

