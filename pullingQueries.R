##3/8/24
##Practice for Topcon



##load data
library(readxl)
alldata <- read_excel("Downloads/5K-7K_Topcon_v1.2.xlsx", sheet = "Acceptable_Scans")
View(alldata)


##take whatever percentile from the group we're interestd in lookin at
##for the sake of practice lets take the bottom 20% of GCL_Total

##get the 20th percentile of this group
total_gcl_20 <- quantile(alldata$GCL_Total, probs = 0.2)


##for practice, same thing with another column/variable
##lower than the 10pct for FtD_Distance_Adjacent
ftd_10pct <- quantile(alldata$FtD_Distance_Adjacent, probs = 0.1)


##separate the dataset to include only entries below this new group/threshold
lower20_gcl_total <- alldata[alldata$GCL_Total < total_gcl_20,]

lower10ftd <- alldata[alldata$FtD_Distance_Adjacent < ftd_10pct,]

##this can also be done using the color codes
##lets do all the red in T_colorCode

red_in_T <- alldata[alldata$T_colorCode == "RED",]


##also talked about getting the value of superior - inferior
##lets make tha variable and this also adds the column to the data

alldata$S_I <- alldata$`Superior Peak` - alldata$`Inferior Peak`
lower20_gcl_total <- lower20_gcl_total$'Superior Peak' - lower20_gcl_total$'Inferior Peak'


##now lets try to pull from the lower20_gcl, all the eyes that have T < lower10tftd and S-I < 101

firstQuery <- lower20_gcl_total[lower20_gcl_total$'4_N' < ftd_10pct & lower20_gcl_total$S_1]
