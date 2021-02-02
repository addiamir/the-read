///SYSTEM GMM METHOD: THE EFFECT OF DIGITAL TECHNOLOGY USAGE IN LOW & MIDDLE INCOME COUNTRIES
///Mohammad Adi Amirudin (120210150071)
/// Must have xtabond2 installed

xtset country year, yearly
summarize grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

////////////////////////////////////////////////////////////////////////////////
///Variable Used: Percobaan 3
///Two Step SYSGMM, Variable growth
grgdpo = depvar
lrgdpo gemp gcn gp6 gp7 gp8 = endogeneous independent variable
law4 ter lfdii = exogeneous variables (instruments)

grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

///Validating System GMM = SYS GMM Approved
///Choosing between Difference GMM or System GMM
///Step 1: Pooled OLS
reg grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

///Step 2: FE Regress
xtreg grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii, fe
estimates store fe

xtreg grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii, re
estimates store re

hausman fe re

corr lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

vif, uncentered


xttest3

xtserial lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

///FGLS Regress
xtgls grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii


///Step 3: Difference GMM
xtabond2 grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii, ///
gmm(L2.rgdpo gemp gcn gp6 gp7 gp8, collapse) iv(law4 ter lfdii) nolevel

///Step 4: Regress Two-Step SYSGMM
xtabond2 grgdpo lrgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii yr_1-yr_5, ///
gmm(L2.rgdpo gemp gcn gp6 gp7 gp8, collapse) iv(law4 ter lfdii) iv(yr_1-yr_5) ///
small twostep robust



estimates table fe, star stats(N r2 r2_a)
///Results: Approved, Good Regression with 2 Variables Correlated...
///Next Step: Validating Regression, Instruments and Variable Chooses.
///Arrelano Bond Test: NO SERIAL AUTOCORRELATIONS
AR(1) : Ho: Not Rejected = Good
AR(2) : Ho: Rejected = Good
///Sargan Test: ALL INSTRUMENTS ARE VALID
Ho: All instruments are valid
Sargan P Value: 0.8 (>0.05 and >0.1)
///Hansen Test: weakened by many instruments, Pvalue > 0.17

///So Data is DONE!!!
SYSGMM Variables Coefficients:



////////////////////////////////////////////////////////////////////////////////
///Variable Used: Percobaan 2
///Two Step SYSGMM, Variable Ln, 
grgdpo = depvar
lrgdpo lemp lcn lp6 lp7 lp8 = endogeneous independent variable
law4 ter lfdii = exogeneous variables (instruments)

grgdpo lrgdpo gemp gcn lp6 lp7 lp8 law4 ter lfdii reg_

///Validating System GMM = SYS GMM not Valid
///Choosing between Difference GMM or System GMM
///Step 1: Pooled OLS
reg grgdpo lrgdpo gemp gcn lp6 lp7 lp8 law4 ter lfdii

///Step 2: FE Regress
xtreg grgdpo lrgdpo gemp gcn lp6 lp7 lp8 law4 ter lfdii, fe

///Step 3: Difference GMM
xtabond2 grgdpo lrgdpo gemp gcn lp6 lp7 lp8 law4 ter lfdii, ///
gmm(L.grgdpo gemp gcn lp6 lp7 lp8, collapse) iv(law4 ter lfdii) nolevel




////////////////////////////////////////////////////////////////////////////////
/// Variable Used: Percobaan 1
/// One Step SYSGMM, Variable Growth, No Dummy
grgdpo l.grgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

/// Legend: 
grgdpo = dependent variable
l.grgdpo gemp gcn gp6 gp7 gp8 = independent variables
law4 ter lfdii = instrument variables

///Choosing between Difference GMM or System GMM
///Step 1: Pooled OLS
reg grgdpo l.grgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii

///Step 2: Fixed Effect Model
xtreg grgdpo l.grgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii, fe

///Step 3: Difference GMM
xtabond2 grgdpo l.grgdpo gemp gcn gp6 gp7 gp8 law4 ter lfdii, ///
gmm(L.(grgdpo gemp gcn gp6 gp7 gp8), collapse) iv(law4 ter lfdii) robust
























