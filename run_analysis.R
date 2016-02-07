library(reader)
library(dplyr)
library(tidyr)
###################################################################################################
############################# Merges the training and the test sets to create one data set ########
###################################################################################################
# Read Training Data
##Read activity
y_train <- tbl_df(read.table("data/train/y_train.txt", header = FALSE, col.names = c("ActivityLabel")))
y_train <- y_train %>% mutate(ActivityName= ifelse(ActivityLabel == 1,"WALKING",ifelse(ActivityLabel == 2, "WALKING_UPSTAIRS",
                                                                           ifelse(ActivityLabel == 3, "WALKING_UPSTAIRS",
                                                                           ifelse(ActivityLabel == 4, "WALKING_DOWNSTAIRS",
                                                                           ifelse(ActivityLabel == 5, "SITTING",
                                                                           ifelse(ActivityLabel == 6, "LAYING",NA)))))))

##Read Person Ids
subject_train <- tbl_df(read.table("data/train/subject_train.txt", header = FALSE, col.names = c("Person Id")))
### Bind Person id  to Main Data Set
main_training <- bind_cols(y_train, subject_train)

##Read the feature lables
features <- tbl_df(read.table("data/features.txt",col.names = c("id","feature"),stringsAsFactors = FALSE))
##Make Syntactically Valid Names
features_lbls <- make.names(features$feature, unique = TRUE)

##Read feature data
##Assign the feature lables to it
x_train <- tbl_df(read.table("data/train/X_train.txt", header = FALSE,col.names = features_lbls))
### Bind Activity to Main Data Set
main_training <- bind_cols(main_training,x_train)
###########################################################################
##Read Body Triaxial acceleration from the accelerometer
###Read X Axis
####Create Name Vector
body_acc_x_names <- c()
for (i in 1:128){body_acc_x_names[i] <- "body_acc_x"}
####Make Syntactically Valid Names
body_acc_x_names <- make.names(body_acc_x_names, unique = TRUE)
####Read X
body_acc_x_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_x_train.txt", col.names = body_acc_x_names))
####Bind Body X acceleration to Main Data Set
main_training <- bind_cols(main_training, body_acc_x_train)

###Read Y Axis
####Create Name Vector
body_acc_y_names <- c()
for (i in 1:128){body_acc_y_names[i] <- "body_acc_y"}
####Make Syntactically Valid Names
body_acc_y_names <- make.names(body_acc_y_names, unique = TRUE)
####Read Y
body_acc_y_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_y_train.txt", col.names = body_acc_y_names))
####Bind Body Y acceleration to Main Data Set
main_training <- bind_cols(main_training, body_acc_y_train)

###Read Z Axis
####Create Name Vector
body_acc_z_names <- c()
for (i in 1:128){body_acc_z_names[i] <- "body_acc_z"}
####Make Syntactically Valid Names
body_acc_z_names <- make.names(body_acc_z_names, unique = TRUE)
####Read Z
body_acc_z_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_z_train.txt", col.names = body_acc_z_names))
####Bind Body Z acceleration to Main Data Set
main_training <- bind_cols(main_training, body_acc_z_train)
########################################################################################
##Read Total Triaxial acceleration from the accelerometer
###Read X Axis
####Create Name Vector
total_acc_x_names <- c()
for (i in 1:128){total_acc_x_names[i] <- "total_acc_x"}
####Make Syntactically Valid Names
total_acc_x_names <- make.names(total_acc_x_names, unique = TRUE)
####Read X
total_acc_x_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_x_train.txt", col.names = total_acc_x_names))
####Bind Body X acceleration to Main Data Set
main_training <- bind_cols(main_training, total_acc_x_train)

###Read Y Axis
####Create Name Vector
total_acc_y_names <- c()
for (i in 1:128){total_acc_y_names[i] <- "total_acc_y"}
####Make Syntactically Valid Names
total_acc_y_names <- make.names(total_acc_y_names, unique = TRUE)
####Read Y
total_acc_y_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_y_train.txt", col.names = total_acc_y_names))
####Bind Body Y acceleration to Main Data Set
main_training <- bind_cols(main_training, total_acc_y_train)

###Read Z Axis
####Create Name Vector
total_acc_z_names <- c()
for (i in 1:128){total_acc_z_names[i] <- "total_acc_z"}
####Make Syntactically Valid Names
total_acc_z_names <- make.names(total_acc_z_names, unique = TRUE)
####Read Z
total_acc_z_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_z_train.txt", col.names = total_acc_z_names))
####Bind Body Z acceleration to Main Data Set
main_training <- bind_cols(main_training, total_acc_z_train)

########################################################################################
##Read Triaxial Angular velocity from the gyroscope
###Read X Axis
####Create Name Vector
body_gyro_x_names <- c()
for (i in 1:128){body_gyro_x_names[i] <- "body_gyro_x"}
####Make Syntactically Valid Names
body_gyro_x_names <- make.names(body_gyro_x_names, unique = TRUE)
####Read X
body_gyro_x_train <- tbl_df(read.table("data/train/Inertial Signals/body_gyro_x_train.txt", col.names = body_gyro_x_names))
####Bind Body X acceleration to Main Data Set
main_training <- bind_cols(main_training, body_gyro_x_train)

###Read Y Axis
####Create Name Vector
body_gyro_y_names <- c()
for (i in 1:128){body_gyro_y_names[i] <- "body_gyro_y"}
####Make Syntactically Valid Names
body_gyro_y_names <- make.names(body_gyro_y_names, unique = TRUE)
####Read Y
body_gyro_y_train <- tbl_df(read.table("data/train/Inertial Signals/body_gyro_y_train.txt", col.names = body_gyro_y_names))
####Bind Body Y acceleration to Main Data Set
main_training <- bind_cols(main_training, body_gyro_y_train)

###Read Z Axis
####Create Name Vector
body_gyro_z_names <- c()
for (i in 1:128){body_gyro_z_names[i] <- "body_gyro_z"}
####Make Syntactically Valid Names
body_gyro_z_names <- make.names(body_gyro_z_names, unique = TRUE)
####Read Z
body_gyro_z_train <- tbl_df(read.table("data/train/Inertial Signals/body_gyro_z_train.txt", col.names = body_gyro_z_names))
####Bind Body Z acceleration to Main Data Set
main_training <- bind_cols(main_training, body_gyro_z_train)
###########################################################################################################
# Read Test Data
##Read feature data


##Read activity
y_test <- tbl_df(read.table("data/test/y_test.txt", header = FALSE, col.names = c("ActivityLabel")))
y_test <- y_test %>% mutate(ActivityName= ifelse(ActivityLabel == 1,"WALKING",ifelse(ActivityLabel == 2, "WALKING_UPSTAIRS",
                                                                         ifelse(ActivityLabel == 3, "WALKING_UPSTAIRS",
                                                                         ifelse(ActivityLabel == 4, "WALKING_DOWNSTAIRS",
                                                                         ifelse(ActivityLabel == 5, "SITTING",
                                                                         ifelse(ActivityLabel == 6, "LAYING",NA)))))))


##Read Person Ids
subject_test <- tbl_df(read.table("data/test/subject_test.txt", header = FALSE, col.names = c("Person Id")))
### Bind Person id  to Main Data Set
main_test <- bind_cols(y_test, subject_test)

##Assign the feature lables to it
x_test <- tbl_df(read.table("data/test/X_test.txt", header = FALSE,col.names = features_lbls))
### Bind Activity to Main Data Set
main_test <- bind_cols(main_test,x_test)
###########################################################################
##Read Body Triaxial acceleration from the accelerometer
###Read X Axis
####Read X
body_acc_x_test <- tbl_df(read.table("data/test/Inertial Signals/body_acc_x_test.txt", col.names = body_acc_x_names))
####Bind Body X acceleration to Main Data Set
main_test <- bind_cols(main_test, body_acc_x_test)

###Read Y Axis
####Create Name Vector
####Read Y
body_acc_y_test <- tbl_df(read.table("data/test/Inertial Signals/body_acc_y_test.txt", col.names = body_acc_y_names))
####Bind Body Y acceleration to Main Data Set
main_test <- bind_cols(main_test, body_acc_y_test)

###Read Z Axis
####Read Z
body_acc_z_test <- tbl_df(read.table("data/test/Inertial Signals/body_acc_z_test.txt", col.names = body_acc_z_names))
####Bind Body Z acceleration to Main Data Set
main_test <- bind_cols(main_test, body_acc_z_test)
########################################################################################
##Read Total Triaxial acceleration from the accelerometer
###Read X Axis
total_acc_x_test <- tbl_df(read.table("data/test/Inertial Signals/total_acc_x_test.txt", col.names = total_acc_x_names))
####Bind Body X acceleration to Main Data Set
main_test <- bind_cols(main_test, total_acc_x_test)

###Read Y Axis
total_acc_y_test <- tbl_df(read.table("data/test/Inertial Signals/total_acc_y_test.txt", col.names = total_acc_y_names))
####Bind Body Y acceleration to Main Data Set
main_test <- bind_cols(main_test, total_acc_y_test)

###Read Z Axis
total_acc_z_test <- tbl_df(read.table("data/test/Inertial Signals/total_acc_z_test.txt", col.names = total_acc_z_names))
####Bind Body Z acceleration to Main Data Set
main_test <- bind_cols(main_test, total_acc_z_test)

########################################################################################
##Read Triaxial Angular velocity from the gyroscope
###Read X Axis
body_gyro_x_test <- tbl_df(read.table("data/test/Inertial Signals/body_gyro_x_test.txt", col.names = body_gyro_x_names))
####Bind Body X acceleration to Main Data Set
main_test <- bind_cols(main_test, body_gyro_x_test)

###Read Y Axis
body_gyro_y_test <- tbl_df(read.table("data/test/Inertial Signals/body_gyro_y_test.txt", col.names = body_gyro_y_names))
####Bind Body Y acceleration to Main Data Set
main_test <- bind_cols(main_test, body_gyro_y_test)

###Read Z Axis
body_gyro_z_test <- tbl_df(read.table("data/test/Inertial Signals/body_gyro_z_test.txt", col.names = body_gyro_z_names))
####Bind Body Z acceleration to Main Data Set
main_test <- bind_cols(main_test, body_gyro_z_test)
#Merge the Two Main Dataset
main <- union(main_training, main_test)

###################################################################################################
############################# Extracts columns containing mean and standard deviation for each measurements ########
###################################################################################################mu
main_std <- main %>% select(contains( "std"))
main_mean <- main %>% select(contains( "mean"))
main_std_mean <- bind_cols(main_std, main_mean)
###################################################################################################
############################# Tidy data set with the average of each variable for each activity and each subject. ########
###################################################################################################mu
main_av <- main %>% group_by(ActivityLabel,ActivityName,Person.Id)%>%  summarise_each(funs(mean))












