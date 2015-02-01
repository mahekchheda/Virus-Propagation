This is the project to study Virus propagation on static graphs.

a. The project has been done on Matlab and al scrits are written in that format for ease of convenience while dealing with Matrices.
For running the project it is needed to install Matlab latest version preferable.

b. Open the Matlab terminal and change the directory to the directory where all the files are unzipped and inside the script folder of my unzipped folder.

c. The code for each of the questions are included in scripts folder. Question 1 and Question 2 are self-descreptive as in they belong to their respective questions and question 3 is split into 4 parts each for policy. 

Policy A: random_immun.m
Policy B: highest_degb.m
Policy C: highest_deg.m
Policy D: new_eigen.m

The main script virus_propagation.m will itself run all the questions in order and display necessary outputs. 

From the terminal of Matlab run the following command:

X = virus_propagation(<path to graph file>);


d. The results and graphs will be displayed on the screen and separately.
(b1,b2) -> The range of values of beta when delta1 and delta2 is 	kept constant to study effect on S.

(d1,d2) -> vice versa case for b1 and b2.

(simulation1 and simulation2) -> Question 2 result for two sets 	of value of beta and delta respectively.

(s_policy<alpha>,simulation_policy<alpha>) -> These return the values of S for different values of K ranging from (10,1000, steps of 10). and simulation is the for that graph.	


e.A sample matlab dataset is being kept inside the scripts folder.
	question1_2_sample.mat : for question 1 and question 2
	question3_sampl.mat: for question 3

f. Citations:
http://www.mathworks.com/help/matlab/


