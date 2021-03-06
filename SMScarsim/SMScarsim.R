# clear variables and close windows
rm(list=ls(all=TRUE))
graphics.off()

# install packages
# install.packages("simba")
library(simba)

# setwd("C:/...")                          # please change working directory
x     = read.table("carmean2.dat") # load data
x     = as.matrix(x[,2:9])         # retrieve Renault, Rover, Toyota
x1719 = x[c(17:19),]

x.mu  = apply(x1719,2,mean)           # column means
y     = matrix(0,nrow(x1719),ncol(x1719)) # empty matrix

# fill binary matrix
for (i in 1:nrow(x1719)){             # if x(i,k)>x_bar(k): 1, else 0
	for(k in 1:ncol(x1719)){
	    if(x1719[i,k]>x.mu[k]){
	    	y[i,k]=1
	    }else{
	    	y[i,k]=0
	    }
	}
}

# similarity coefficients for binary data

sim(y,method="jaccard")         # jaccard

sim(y,method="simplematching")  # simple matching

sim(y,method="roger")           # tanimoto