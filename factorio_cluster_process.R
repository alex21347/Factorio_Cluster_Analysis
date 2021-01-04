install.packages("spatstat")
library(spatstat)

#point process example object
data(swedishpines)

#loading factorio data
factorio_data <- read.csv('C:/Users/alex/Documents/myPython/RUG/Topological Data Analysis 2020/factorio_data.csv')

#putting data in desired form
factorio_data <- c(factorio_data)
factorio_data_x <- factorio_data$X0
factorio_data_y <- factorio_data$X1

placeholder <- swedishpines
placeholder$n <- length(factorio_data_x)
placeholder$x <- factorio_data_x
placeholder$y <- factorio_data_y
placeholder$window$xrange <- c(-1000,1000)
placeholder$window$yrange <- c(-1000,1000)

factorio_data <- placeholder

#plot and analyse point process
plot(factorio_data)
pcf_sp <- pcf(factorio_data)
plot(pcf_sp, ylim = c(0,10))
plot(Kest(factorio_data))

#fitting data to Matern cluster process
matern_fitted <- matclust.estpcf(factorio_data, startpar=c(kappa=1,scale=1))

#simulating new fitted cluster process and plotting
sim_clust <- rMatClust(matern_fitted$clustpar[1], matern_fitted$clustpar[2], 5, win = owin(c(-1000,1000),c(-1000,1000)))
plot(sim_clust)

#Matern cluster process does not encapsulate all the desired properties. The population of the clusters seems dependent on the
#distance from the origin, thus for a more accurate model we must construct a gibbs process that also takes the distance
#to the origin as a parameter.
