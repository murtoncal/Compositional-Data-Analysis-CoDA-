Sed <- read.table("Pq_Dat.csv", sep=",", header=T, row.names = 1)

Sand_prop <- Sand*(0.01)
Silt_prop <- Silt*(0.01)
Clay_prop <- Clay*(0.01)

attach(Sed)

# Linear Regression

lm.sand <- lm(Sand_prop~Depth)
sand.fit <- lm.sand$fitted

lm.silt <- lm(Silt_prop~Depth)
silt.fit <- lm.silt$fitted

lm.clay <- lm(Clay_prop~Depth)
clay.fit <- lm.clay$fitted

total <- sand.fit+silt.fit+clay.fit
total

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(lm.sand)

# Diagnostic Plots

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(lm.sand)

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(lm.silt)

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(lm.clay)

par(mfrow=c(3,1))
plot(Depth,sand.fit,type="p",col="blue",pch=3,ylab="Sand",xlab="Depth")
par(new=TRUE)
plot(Depth,Sand_prop,type="p",col="red",pch=21,ylab="",xlab="", xaxt = "n",
     yaxt = "n")
plot(Depth,silt.fit,type="p",col="blue",pch=3,ylab="Silt" ,xlab="Depth")
par(new=TRUE)
plot(Depth,Silt_prop,type="p",col="red",pch=21,ylab="",xlab="", xaxt = "n",
     yaxt = "n")
plot(Depth,clay.fit,type="p",col="blue",pch=3,ylab="Clay",xlab="Depth")
par(new=TRUE)
plot(Depth,Clay_prop,type="p",col="red",pch=21,ylab="",xlab="", xaxt = "n",
     yaxt = "n")

# Multivariate Regression

m1 <- lm(cbind(Silt_prop,Sand_prop,Clay_prop)~Depth)
m1$fitted

# Log-Odds Transformation

odds_Sand <- log(Sand_prop/(1-(Sand_prop)))
odds_Silt <- log(Silt_prop/(1-(Silt_prop)))
odds_Clay <- log(Clay_prop/(1-(Clay_prop)))

sum.odds <- odds_Sand+odds_Silt+odds_Clay
sum.odds

olm.sand <- lm(odds_Sand~Depth)
odds.sand.fit <- olm.sand$fitted

olm.silt <- lm(odds_Silt~Depth)
odds.silt.fit <- olm.silt$fitted

olm.clay <- lm(odds_Clay~Depth)
odds.clay.fit <- olm.clay$fitted


par(mfrow=c(1,2))
plot(Depth,odds_Sand,col="black",pch=1,cex=1,ylab="Log Odds of Sand",
     xlab="Depth (m)")
points(Depth, odds.sand.fit,col="black",pch=4,cex=1)
legend(x=50,y=1.25,legend=c("Observed Values","Fitted Values"),pch=c(1,4),col=c("black","black"),
       bty="n",cex=1.2, pt.cex=2.5)
plot(Depth,odds_Clay,col="black",pch=1,cex=1,ylab="Log Odds of Clay",
     xlab="Depth (m)")
points(Depth, odds.clay.fit,col="black",pch=4,cex=1)
legend(x=50,y=-4.5,legend=c("Observed Values","Fitted Values"),pch=c(1,4),col=c("black","black"),
       bty="n",cex=1.2,pt.cex=2.5)


# Diagnostic plots 

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(olm.sand)

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(olm.silt)

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(olm.clay)


# Diagnostic plot comparison

par(mfrow=c(2,2),  pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(lm.clay)

par(mfrow=c(2,2), pty="m",mai=c(0.9,0.8,0.3,0.35), cex.lab=1.2, cex.axis=0.8)
plot(olm.clay)


# Outliers

t(Sed[c(-12),])
