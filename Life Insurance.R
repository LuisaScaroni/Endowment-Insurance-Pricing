#####################################################
#HIPPOCRATE INSURANCE: Luisa Scaroni, Maria Theodosiou, Chao Gao, Kit Ching Choy
#####################################################
#R CODE FOR PRACTISE SESSION 2: CREATING AN INSURANCE
#####################################################

#First of all, since we consider an XK table we consider two different weights
#for women and male in order to calculate the mixed one through the MK and FK
#considering K+1 and the following weights 
#weight women=0.35
#weight men=0.65
#------>usually more men sign an insurance contract compared to women
ww=0.35 #weight women
wm=0.65 #weight men
 
#########################################
#Then we define all the values which do not change because of the sex or kind of table->'constant' ones
b1=0.1 #Inventory Vharge on Reserve
b2=0.001 #Inventory Charge on Capital
KL=25000 #Capital Life
C=0.13 #Acquisition Charge
fr=2.5 #Flatrate
#########################################


#-----------------------
###############################
###############################
#one with no changes: XK TABLE#
###############################
###############################
i=0.0375 #intrest rate
v=(1+i)^(-1) #discount factor
v #0.9638554
v20=v^(20)
v20 #0.4788923

#With weighted average we calculate axm for the different ages: 35,45,55
axm35=ww*8.466155 +wm*8.419714
axm45=ww*8.408833+wm*8.305200 
axm55=ww*8.237478 +wm*8.009992
axm35 #8.435968
axm45 #8.341472
axm55 #8.089612

#We calculate the weighted average of Term Life Insurance
Axn35=ww*0.034258 +wm*0.064182 
Axn45=ww*0.080992 +wm*0.142899 
Axn55=ww*0.204318 +wm*0.310098 
Axn35 #0.0537086
Axn45 #0.1212315
Axn55 #0.273075

#We calculate the weighted Pure Endowment in order to find UP
nEx35=ww*0.453045+wm*0.430497
nEx45=ww*0.416723+wm*0.370765
nEx55=ww*0.322763+wm*0.248278
nEx35 #0.4383888
nEx45 #0.3868503
nEx55 #0.2743478

#We calculate Unique Premium 
UP35=(nEx35+Axn35)*KL
UP45=(nEx45+Axn45)*KL
UP55=(nEx55+Axn55)*KL
UP35 #12302.44
UP45 # 12702.44
UP55 #13685.57

#we calculate the Periodic Premium
PP35=UP35/axm35
PP45=UP45/axm45
PP55=UP55/axm55
PP35  #1458.331
PP45   #1522.758
PP55  #1691.746

if (10*PP35 > UP35) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PP45 > UP45) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

if (10*PP55 > UP55) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

#------------------------------------------------
#WE NOW CALCULATE THE COMMERCIAL TARIFF PREMIUM#
#I consider interest rate=3.65
#I define the values and then calculate:
#Pure Endowment:
nEx35i=ww*0.461867+wm*0.438881
nEx45i=ww*0.424838 +wm*0.377985
nEx55i=ww*0.329049 +wm*0.253113 
nEx35i #0.4469261
nEx45i #0.3943836
nEx55i #0.2796906

#Term Insurance:
Axn35i=ww*0.034649 +wm*0.064914 
Axn45i=ww*0.081955+wm*0.144544 
Axn55i=ww*0.2067267 +wm*0.313525 
Axn35i #0.05432125
Axn45i #0.1226379
Axn55i #0.2761456

#Temporary Annuity for n years:
axn35i=ww*14.297555 +wm*14.090866
axn45i=ww*14.005716 +wm*13.558867 
axn55i=ww*13.182709 +wm*12.306306 
axn35i #14.16321
axn45i #13.71526
axn55i #12.61305

#Inventory Premium:
Pprime35=KL*(nEx35i+Axn35i+b2*axn35i)
Pprime45=KL*(nEx45i+Axn45i+b2*axn45i)
Pprime55=KL*(nEx55i+Axn55i+b2*axn55i)
Pprime35 #12885.26
Pprime45 #13268.42
Pprime55 #14211.23

#Commercial Premium
Psecond35=Pprime35/(1-C)
Psecond45=Pprime45/(1-C)
Psecond55=Pprime55/(1-C)
Psecond35 #14810.65
Psecond45 #15251.05
Psecond55 #16334.75

#Single Tariff Premium
UPnew35=Psecond35+fr
UPnew45=Psecond45+fr
UPnew55=Psecond55+fr
UPnew35 #14813.15
UPnew45 #15253.55
UPnew55 #16337.25

#Annuity factor for the premium payment period m=10
axm35new=ww*8.500410 +wm*8.453684 
axm45new=ww*8.442731 +wm*8.338462 
axm55new=ww*8.270311  +wm* 8.041439
axm35new #8.470038
axm45new #8.374956
axm55new #8.121544

#Periodic Tariff Premium
PPnew35=(Psecond35+10*fr)/axm35new
PPnew45=(Psecond45+10*fr)/axm45new
PPnew55=(Psecond55+10*fr)/axm55new
PPnew35 #1751.544
PPnew45 #1824.016
PPnew55 #2014.364

if (10*PPnew35 > UPnew35) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PPnew45 > UPnew45) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

if (10*PPnew55 > UPnew55) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

#----------------------------------------------------
##########################
##########################
###only males: MK TABLE###
##########################
##########################
#Number of lives at age x:
l35male=955896.29
l45male=924868.45
l55male=859297.42
l65male=716046.27
l75male=445495.73

#Term Insurance:
Axn35male=0.064182 
Axn45male=0.142899 
Axn55male=0.310098 

#Net Single Premium:
UP35male=(v20*l55male/l35male+Axn35male)*KL
UP45male=(v20*l65male/l45male+Axn45male)*KL
UP55male=(v20*l75male/l55male+Axn55male)*KL
UP35male  #12366.99
UP45male  #12841.61
UP55male  #13959.4

#Net Periodic Premium:
PP35male=UP35male/8.419714 #divided by Temporary Life Annuity
PP45male=UP45male/8.305200
PP55male=UP55male/8.009992
PP35male #1468.813
PP45male #1546.213
PP55male #1742.748

if (10*PP35male > UP35male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PP45male > UP45male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PP55male > UP55male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

#Inventory Premium:
Pprime35male=KL*(0.438881 +0.064914+b2*14.090866)
Pprime45male=KL*(0.377985+0.144544+b2*13.558867)
Pprime55male=KL*(0.253113 +0.313525+b2*12.306306 )
Pprime35male #12947.15
Pprime45male #13402.2
Pprime55male #14473.61

#Commercial Premium:
Psecond35male=Pprime35male/(1-C)
Psecond45male=Pprime45male/(1-C)
Psecond55male=Pprime55male/(1-C)
Psecond35male #14881.78
Psecond45male #15404.82
Psecond55male #16636.33

#Final Single Premium
UPnew35male=Psecond35male+fr
UPnew45male=Psecond45male+fr
UPnew55male=Psecond55male+fr
UPnew35male #14884.28
UPnew45male #15407.32
UPnew55male #16638.83

#Final Periodic Premium
PPnew35male=(Psecond35male+10*fr)/8.453684 
PPnew45male=(Psecond45male+10*fr)/8.338462 
PPnew55male=(Psecond55male+10*fr)/8.041439
PPnew35male #1763.347
PPnew45male #1850.44
PPnew55male #2071.934

if (10*PPnew35male > UPnew35male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PPnew45male > UPnew45male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PPnew55male > UPnew55male) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

#----------------------------------------------
###########################
###########################
###increasing rate: 4.75###
###########################
###########################
iincr=0.0475 #increased interest rate
vincr=(1+iincr)^(-1) #discount factor
v20incr=vincr^(20) 

#I use XK table so I have to calculate the weighted average
#Temporary Annuity:
axm35incr=ww*8.136204+wm*8.092499
axm45incr=ww*8.08230428882253+wm*7.984769
axm55incr=ww*7.921146+wm*7.706948
axm35incr #8.107796
axm45incr #8.018906
axm55incr #7.781917

#Term Insurance:
Axn35incr=ww*0.034258 +wm*0.064182 
Axn45incr=ww*0.080992 +wm*0.142899 
Axn55incr=ww*0.204318 +wm*0.310098 
Axn35incr #0.0537086
Axn45incr #0.1212315
Axn55incr #0.273075

#Pure Endowment:
nEx35incr=ww*0.373958+wm*0.355347
nEx45incr=ww*0.343977+wm*0.306042
nEx55incr=ww*0.266419+wm*0.204937
nEx35incr #0.3618609
nEx45incr #0.3193192
nEx55incr #0.2264557

#Net Single Premium:
UP35incr=(nEx35incr+Axn35incr)*KL
UP45incr=(nEx45incr+Axn45incr)*KL
UP55incr=(nEx55incr+Axn55incr)*KL
UP35incr #103895.24
UP45incr #11013.77
UP55incr #12488.27

#Net Periodic Premnium
PP35incr=UP35incr/axm35incr
PP45incr=UP45incr/axm45incr
PP55incr=UP55incr/axm55incr
PP35incr #1281.389
PP45incr #1373.475
PP55incr #1604.78

if (10*PP35incr > UP35incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PP45incr > UP45incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PP55incr > UP55incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}

#----------------------------------------------------
#Calculate Tariff Premium  with i=4.65%
#Pure Endowment:
incrnEx35i=ww*0.381170 +wm*0.362200 
incrnEx45i=ww*0.350610+wm*0.311944 
incrnEx55i=ww*0.271557 +wm*0.208889 
incrnEx35i #0.3688395
incrnEx45i #0.3254771
incrnEx55i #0.2308228

#Term Insurance:
incrAxn35i=ww*0.030991 +wm*0.058064 
incrAxn45i=ww*0.072948 +wm*0.129150
incrAxn55i=ww*0.184198 +wm*0.281393 
incrAxn35i #0.04858845
incrAxn45i #0.1094793
incrAxn55i #0.2473747

#Temporary Annuity
incraxn35i=ww*13.229534 +wm*13.047185 
incraxn45i=ww*12.973042 +wm*12.578386
incraxn55i=ww*12.248431 +wm*11.471397 
incraxn35i #13.11101
incraxn45i #12.71652
incraxn55i #11.74336

#Inventory Premium
Pprime35incr=KL*(incrnEx35i+incrAxn35i+b2*incraxn35i)
Pprime45incr=KL*(incrnEx45i+incrAxn45i+b2*incraxn45i)
Pprime55incr=KL*(incrnEx55i+incrAxn55i+b2*incraxn55i)
Pprime35incr #10763.47
Pprime45incr #11191.82
Pprime55incr #12248.52

#Commercial Premium
Psecond35incr=Pprime35incr/(1-C)
Psecond45incr=Pprime45incr/(1-C)
Psecond55incr=Pprime55incr/(1-C)
Psecond35incr #12371.81
Psecond45incr #12864.16
Psecond55incr #14078.76

#Tariff Premium
UPnew35incr=Psecond35incr+fr
UPnew45incr=Psecond45incr+fr
UPnew55incr=Psecond55incr+fr
UPnew35incr #
UPnew45incr #
UPnew55incr #

#Unique Premium
axm35newincr=ww*8.168197 +wm*8.124228 
axm45newincr=ww*8.113967 +wm*8.015843 
axm55newincr=ww*7.951824 +wm*7.736344 
axm35newincr  #12374.31
axm45newincr #12866.66
axm55newincr #14081.26

#Periodic Premium:
PPnew35incr=(Psecond35incr+10*fr)/axm35newincr
PPnew45incr=(Psecond45incr+10*fr)/axm45newincr
PPnew55incr=(Psecond55incr+10*fr)/axm55newincr
PPnew35incr #1523.021
PPnew45incr #1601.101
PPnew55incr #1805.452
if (10*PPnew35incr > UPnew35incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PPnew45incr > UPnew45incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}
if (10*PPnew55incr > UPnew55incr) {
  print("RIGHT: PP payments are more expensive than lump sum")
} else {
  print("PP payments are cheaper than lump sum")
}


####################################################
####################################################
#######PART 3######################################
###################################################
#Code for plotting the three graphs
# We create a graph for alle the case
#XK TABLE: 3.75%
t <- 0:20
reserves_XK <- c(
  0.00,       # t=0
  1465.902235	,    # t=1 
  2987.10582	,    # t=2
  4565.921777	,    # t=3
  6204.813427	,    # t=4
  7906.415726	,    # t=5
  9673.557878	 ,    # t=6
  11509.28981	,   # t=7
  13416.91325	,   # t=8
  15400.0181	,   # t=9
  17462.52542	,
  18089.53036,	
  18740.5442	,
  19416.82589	,
  20119.77199	,
  20850.94033	,
  21612.07834,	
  22405.15679	,
  23232.41026,	
  24096.38554	,
  25000	  # t=10 (END)
  
)
plot(t, reserves_XK, type="o", pch=19, col="blue", lwd=2,
     main="Endowment Insurance XK 3.75%",
     xlab="Time", 
     ylab="Policy value",
     xaxt="n") 

axis(1, at=0:20, labels=0:20)

grid()

abline(v=10, col="red", lty=2)

#########################################
#------------------------------------------
# XK 4.75%
t <- 0:20
reserves_XK <- c(
  
  0	,
  1276.515866	,
  2613.581751	,
  4014.271855	,
  5481.868437	,
  7019.885439	,
  8632.095934	,
  10322.56412	,
  12095.68272	,
  13956.21667	,
  15909.35456	,
  16631.33361	,
  17388.06951	,
  18181.65334	,
  19014.39213	,
  19888.84412	,
  20807.86092	,
  21774.63794	,
  22792.7749	,
  23866.34845	,
  25000	
)

plot(t, reserves_XK, type="o", pch=19, col="blue", lwd=2,
     main="Endowment Insurance XK 4.75%",
     xlab="Time", 
     ylab="Policy value",
     xaxt="n") 

axis(1, at=0:20, labels=0:20)

grid()

abline(v=10, col="red", lty=2)

###############################
#------------------------------
#MK 3.75
t <- 0:20
reserves_MK <- c(
  
  0	,
  1468.047122	,
  2991.382752	,
  4572.377511	,
  6213.572083	,
  7917.700053	,
  9687.714627	,
  11152.81991	,
  13438.50761	,
  15426.60005	,
  17495.30083	,
  18117.91475	,
  18764.45702	,
  19436.26377	,
  20134.8293	,
  20861.83371	,
  21619.17595	,
  22409.01323	,
  23233.80821	,
  24096.38554	,
  25000
  
)

plot(t, reserves_MK, type="o", pch=19, col="blue", lwd=2,
     main="Endowment Insurance MK 3.75%",
     xlab="Time", 
     ylab="Policy value",
     xaxt="n")

axis(1, at=0:20, labels=0:20)

grid()

abline(v=10, col="red", lty=2)

##############################################
##############################################
#PROFIT SHARING#
#calculate the profit sharing and dotation
KL=25000
KO=25000
wd=0.02
policyvalue5=7906.415726
dotation=wd*policyvalue5 #158.1283
deltaKL=dotation/(0.5329968+0.05304 ) #269.8266
deltaKO=deltaKL #269.8266
newKO=KO+deltaKO #25269.83
newKL=KL+deltaKL

