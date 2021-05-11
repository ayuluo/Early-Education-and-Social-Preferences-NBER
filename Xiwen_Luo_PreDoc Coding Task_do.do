*Samek Pre-Doc Coding Task

**1. Use this data to create Tables 1 and 3 for this paper. Create a folder with all the materials that are used to create the tables as well as the tables themselves. Include the do file used.

***Organizing & inspecting data to see if there's any merging/cleaning needed

clear all
cd "C:\Users\Sivan Luo\Documents\STATA data\Samek Pre-Doc Coding Task"
use "C:\Users\Sivan Luo\Documents\STATA data\Samek Pre-Doc Coding Task\data_JPE_2019_deidentified.dta"
encode treatment2010 , gen(treat2010_num)
tabulate treat2010_num
encode treatment2011 , gen(treat2011_num)
tabulate treat2011_num
encode treat , gen(treat_num)
tabulate treat_num

***Note: Inspecting the data set, one data point seems to be missing from the Control group, this might cause some discrepency in my data analysis later on.

***1.1 Create Table 1 "Balance Table"

****Average age in years

mean age_at_test if any_PK ==0 & any_PA ==0
mean age_at_test if any_PA ==1
mean age_at_test if any_PK ==1
mean age_at_test

****Share of female

proportion female if in_experiment == 1 & treat == "Control"
proportion female if in_experiment == 1 & treat == "PA"
proportion female if in_experiment == 1 & treat == "PK"
proportion female if in_experiment == 1

****Share of Black

proportion black if in_experiment == 1 & treat == "Control"
proportion black if in_experiment == 1 & treat == "PA"
proportion black if in_experiment == 1 & treat == "PK"
proportion black if in_experiment == 1

****Share of Hispanic

proportion hispanic if in_experiment == 1 & treat == "Control"
proportion hispanic if in_experiment == 1 & treat == "PA"
proportion hispanic if in_experiment == 1 & treat == "PK"
proportion hispanic if in_experiment == 1

****Share of White

proportion white if in_experiment == 1 & treat == "Control"
proportion white if in_experiment == 1 & treat == "PA"
proportion white if in_experiment == 1 & treat == "PK"
proportion white if in_experiment == 1

****Average time of day

mean time_hours2 if in_experiment == 1 & treat == "Control"
mean time_hours2 if in_experiment == 1 & treat == "PA"
mean time_hours2 if in_experiment == 1 & treat == "PK"
mean time_hours2 if in_experiment == 1

***1.2 Create Table 3 "Regressions"

****Dictator being the dependent variable 

reg inequalitydictator any_PK any_PA
reg inequalitydictator any_PK any_PA age_at_test female black hispanic

*****F-test

test any_PK=any_PA=0

****Efficiency being the dependent variable

reg inequalityefficiency any_PK any_PA
reg inequalityefficiency any_PK any_PA age_at_test female black hispanic

*****F-test

test any_PK=any_PA=0

****Luck being the dependent variable

reg inequalitylucky any_PK any_PA
reg inequalitylucky any_PK any_PA age_at_test female black hispanic

*****F-test

test any_PK=any_PA=0

****Merit being the dependent variable

reg inequalitymerit any_PK any_PA
reg inequalitymerit any_PK any_PA age_at_test female black hispanic

*****F-test

test any_PK=any_PA=0

****Merit + Luck being the dependent variable 

reg inequalitymeritlucky any_PK any_PA
reg inequalitymeritlucky any_PK any_PA age_at_test female black hispanic

*****F-test

test any_PK=any_PA=0

**2. What robustness tests are useful to do for this paper? Such a test may be desired to confirm that the results hold. Describe the test below. Use your do-file to generate another table with a new test.

***Similar to how the robustness was tested in Table 1, an F-test of joint significance can be applied here in Table 3 (besides the R-squared values that are already included in the regression models). Since we only need to know if the coefficiences of "PK Dummy" and "PA Dummy" have significant explanatory power in our regression models, we just have to add the F-test to all of our regressions in Table 3 by making the null hypothesis "PK Dummy=PA Dummy=0" and checking to see if we will be able to reject our null hypothesis, and if so, at what confidence level (99%, 95% or 90%). The codes for F-tests are shown above in part 1.2.


**3. Think of another original research question related to this paper that could be asked. Describe the question below, indicate how you are going to test the question and indicate why you think it is important, in about 5 sentences maximum.

**Comparing the difference between two curricula used in the Preschool treatment group, the Literacy Express and the Tools of the Mind curriculum vary by their focuses - while the Literacy Express places more focus on building basic literacy skills (e.g. reading, math, science, etc.), the Tools of the Mind helps "develop the cognitive, social-emotional, self-regulatory" skills (https://toolsofthemind.org/learn/what-is-tools/ & https://ies.ed.gov/ncee/wwc/EvidenceSnapshot/288). Given the difference in these two curricula, I would want to see if the effects these curricula have on promoting egalitarian thinking among children differ, and if so, by how much. The same research methodology can be applied among Preschool participants who had these two different curricula - 1) expand the Preschool program to include more children in the sample; 2) run the same experiments (dictator, efficiency, etc.); 3) run the same regressions but split the "PK Dummy" into two variables - PKL and PKT - by different curricula and then compare the difference in these two models - coeffcients, constants, etc.