###############################################
# Group assignment - PolSci 231B (2017)
###############################################

library(foreign)
setwd("~/Dropbox/Academic/UC_Berkeley/GSI/PS_231B/group_assignment")
students <- as.vector(read.csv("course_pol_sci-231b-2017-B_rosters.csv", header = TRUE)[,1])

# setting seed so that we can reproduce the sampling with the same results
set.seed(532)

# there will be 4 groups of 3 
groups <- rep(1:4, 3)
students <- as.data.frame(cbind(students, sample(groups, length(students), replace=F)))
names(students) <- c("student", "group")

# creating a list to print students by group
groups <- list(NA)
for (i in 1:4){groups[[i]] <- students[students$group==i,1:2]}

names(groups) <-   paste0("GROUP ", 1:4)

groups

save(groups, file="groups.Rda")
