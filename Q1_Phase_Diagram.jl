# Example for constructing a streamplot in Julia for phase portraits
# CHEME5440/7770 - Spring 2021
# The example makes use of Makie.jl and AbstractPlotting.jl for plotting
# To install the packages, use the following commands inside the Julia REPL:
# using Pkg
# Pkg.add("Makie")
# Pkg.add("AbstractPlotting")

using Makie
using AbstractPlotting
using AbstractPlotting.MakieLayout
AbstractPlotting.inline!(true)


# Model for precise adaptation
# Xa: active receptor state
# Xi: inactive receptor state
function precise_adapt(u, v)

alpha=10
n1=2
n2=2
    
    f = alpha/(1+v^n1)-u
    g = alpha/(1+u^n1)-v
    
    return Point(f,g)
end

# Construct the streamplot
plt1 = Scene(resolution =(400,400))
streamplot!(plt1, precise_adapt, 0..10, 0..10, colormap = :plasma, 
    gridsize= (32,32), arrow_size = 0.1)

# Display the plot
display(plt1)

# Save the plot
save("n2.png", plt1)
