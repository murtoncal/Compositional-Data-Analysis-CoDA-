Sed <- read.table("Pq_Dat.csv", sep=",", header=T, row.names = 1)

# EDA

attach(Sed)

head(Sed,20)
str(Sed)

# Summary statistics of each variable

summary(Sed)

par(mfrow=c(1,3))
boxplot(Sand, ylab="Sand", ylim=c(0,100), cex.lab=2.5, cex.axis=1.5,
        col='powderblue')
boxplot(Silt, ylab="Silt", ylim=c(0,100), cex.lab=2.5, cex.axis=1.5,
        col='mistyrose')
boxplot(Clay, ylab="Clay", ylim=c(0,100), cex.lab=2.5, cex.axis=1.5,
        col='darkolivegreen1')

# Sediment against depth

par(mfrow=c(1,3))
plot(Depth, Sand, type="p", col="black", bg="yellow", cex=2, cex.lab=1.5,
     cex.axis=1.2,  pch=21, ylim=c(0,100), xlab="Depth (m)", frame=TRUE)
plot(Depth, Silt, type="p", col="black", bg="green", cex=2, cex.lab=1.5,
     cex.axis=1.2, pch=21, ylim=c(0,100), xlab="Depth (m)", frame=TRUE)
plot(Depth, Clay, type="p", col="black", bg="grey", cex=2, cex.lab=1.5,
     cex.axis=1.2, pch=21, ylim=c(0,100), xlab="Depth (m)", frame=TRUE)

# Sediment correlation

par(mfrow=c(1,3))
plot(Clay, Sand, type="p", col="blue", cex=2, cex.lab=1.5,
     cex.axis=1.2,  pch=19, xlim=c(0,100), ylim=c(0,100), frame=TRUE)
plot(Silt, Sand, type="p", col="orange", cex=2, cex.lab=1.5,
     cex.axis=1.2, pch=19, xlim=c(0,100), ylim=c(0,100), frame=TRUE)
plot(Silt, Clay, type="p", col="purple", cex=2, cex.lab=1.5,
     cex.axis=1.2, pch=19, xlim=c(0,100), ylim=c(0,100), frame=TRUE)

# Gaussianity

par(mfrow=c(2,1))
hist(Depth)
hist(log(Depth))

# Ternary Plot

install.packages('Ternary')

library('Ternary')

data_points <- list(
        d1 = c(77.5,19.5,3.0),
        d2 = c(71.7,24.9,3.2),
        d3 = c(50.7,36.1,13.2),
        d4 = c(52.2,40.9,6.6),
        d5 = c(70.0,26.5,3.5),
        d6 = c(66.5,32.2,1.3),
        d7 = c(43.1,55.3,1.6),
        d8 = c(53.4,36.8,9.8),
        d9 = c(15.5,54.4,30.1),
        d10 = c(31.7,41.5,26.8),
        d11 = c(65.7,27.8,6.5),
        d12 = c(70.4,29.0,0.6),
        d13 = c(17.4,53.6,29.0),
        d14 = c(10.6,69.8,19.6),
        d15 = c(38.2,43.1,18.7),
        d16 = c(10.6,52.7,36.5),
        d17 = c(18.4,50.7,30.9),
        d18 = c(4.6,47.4,48.0),
        d19 = c(15.6,50.4,34.0),
        d20 = c(31.9,45.1,23.0),
        d21 = c(9.5,53.5,37.0),
        d22 = c(17.1,48.0,34.9),
        d23 = c(10.5,55.4,34.1),
        d24 = c(4.8,54.7,41.0),
        d25 = c(2.6,45.2,52.2),
        d26 = c(11.4,52.7,35.9),
        d27 = c(6.7,46.9,46.4),
        d28 = c(6.9,49.7,43.4),
        d29 = c(4.0,44.9,51.1),
        d30 = c(7.4,51.6,40.9),
        d31 = c(4.8,49.5,45.7),
        d32 = c(4.5,48.5,47.0),
        d33 = c(6.6,52.1,41.3),
        d34 = c(6.7,47.3,45.9),
        d35 = c(7.4,45.6,46.9),
        d36 = c(6.0,48.9,45.1),
        d37 = c(6.3,53.8,39.9),
        d38 = c(2.5,48.0,49.5),
        d39 = c(2.0,47.8,50.2)
)

TernaryPlot(alab = "Clay Separate (%) \n \u2192", blab = "Silt Separate (%) \n \u2192", 
            clab = "Clay Separate (%) \n \u2190", lab.col = c('goldenrod', 'darkgreen', 'grey47'), 
            grid.minor.lines = 1, lab.cex = 1.5, axis.cex = 1, grid.lty = 'solid', 
            grid.lines = 4, axis.col = "black")
TernaryPoints(data_points, pch=21, cex=1.5, bg="dodgerblue", col='black')


coords <- list(
        A = c(1, 0, 2),
        B = c(1, 1, 1),
        C = c(1.5, 1.5, 0),
        D = c(0.5, 1.5, 1)
)
TernaryPlot()
AddToTernary(lines, coords, col='darkgreen', lty='dotted', lwd=3)
TernaryLines(coords, col='darkgreen')
TernaryArrows(coords[1], coords[2:4], col='orange', length=0.2, lwd=1)
TernaryText(coords, cex=0.8, col='red', font=2)
TernaryPoints(coords, pch=1, cex=2, col='blue')
AddToTernary(points, coords, pch=1, cex=3)

# add lines
# change axis labels