#####
##Plotting data downloaded from the United States Mortality Database. Eddie Hunsinger, February 2023.
#####

setwd("/home/.../Desktop")

DC_mltper_1x10<-data.frame(read.table("lifetables/States/DC/DC_mltper_1x10.csv",header=TRUE,sep=","))
DC_mltper_1_2010to2019<-DC_mltper_1x10[DC_mltper_1x10$Year=="2010-2019",]

DE_mltper_1x10<-data.frame(read.table("lifetables/States/DE/DE_mltper_1x10.csv",header=TRUE,sep=","))
DE_mltper_1_2010to2019<-DE_mltper_1x10[DE_mltper_1x10$Year=="2010-2019",]

MD_mltper_1x10<-data.frame(read.table("lifetables/States/MD/MD_mltper_1x10.csv",header=TRUE,sep=","))
MD_mltper_1_2010to2019<-MD_mltper_1x10[MD_mltper_1x10$Year=="2010-2019",]

PA_mltper_1x10<-data.frame(read.table("lifetables/States/PA/PA_mltper_1x10.csv",header=TRUE,sep=","))
PA_mltper_1_2010to2019<-PA_mltper_1x10[PA_mltper_1x10$Year=="2010-2019",]

VA_mltper_1x10<-data.frame(read.table("lifetables/States/VA/VA_mltper_1x10.csv",header=TRUE,sep=","))
VA_mltper_1_2010to2019<-VA_mltper_1x10[VA_mltper_1x10$Year=="2010-2019",]

WV_mltper_1x10<-data.frame(read.table("lifetables/States/WV/WV_mltper_1x10.csv",header=TRUE,sep=","))
WV_mltper_1_2010to2019<-WV_mltper_1x10[WV_mltper_1x10$Year=="2010-2019",]

logMort<-data.frame(log(DC_mltper_1_2010to2019$mx))
colnames(logMort)<-"DC"
logMort$DE<-log(DE_mltper_1_2010to2019$mx)
logMort$MD<-log(MD_mltper_1_2010to2019$mx)
logMort$PA<-log(PA_mltper_1_2010to2019$mx)
logMort$VA<-log(VA_mltper_1_2010to2019$mx)
logMort$WV<-log(WV_mltper_1_2010to2019$mx)

plot(logMort$DC,type="l",lwd=3,ylab="log mortality, male", xlab="age")
lines(logMort$DE,col=2)
lines(logMort$MD,col=3)
lines(logMort$PA,col=4)
lines(logMort$VA,col=5)
lines(logMort$WV,col=6)

mtext("Plot of selected 2010 to 2019 (10 year) life tables from the United States Mortality Database (https://usa.mortality.org/), Feb 2023.",cex=.75,side=1,line=4)
legend(.5, -.25, legend=c("DC", "DE", "MD", "PA", "VA", "WV"), lty=c(1,1,1,1,1,1), col=c(1,2,3,4,5,6), lwd=c(3,1,1,1,1,1), cex=1.25)

