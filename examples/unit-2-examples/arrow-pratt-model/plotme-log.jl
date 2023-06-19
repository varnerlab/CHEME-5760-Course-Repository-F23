include("Include.jl")

plot(risk_aversion_array[:,1], risk_aversion_array[:,3], label="", lw=3, c=colors[2],  bg="floralwhite",
    background_color_outside="white", framestyle = :box, fg_legend = :transparent);
xlabel!("Wealth (w)", fontsize=18);
ylabel!("Absolute Risk Aversion (UA)", fontsize=18);

# save -
savefig(joinpath(_PATH_TO_FIGS, "Fig-ArrowPratt-log.pdf"))
