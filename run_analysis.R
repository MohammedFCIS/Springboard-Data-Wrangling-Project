library(reader)
library(dplyr)
library(tidyr)
# Read Training Data
##Read the feature lables
features <- tbl_df(read.table("data/features.txt",col.names = fc("id","feature"),stringsAsFactors = FALSE))
##Make Syntactically Valid Names
features_lbls <- make.names(features$feature, unique = TRUE)

##Read feature data
##Assign the feature lables to it
x_train <- tbl_df(read.table("data/train/X_train.txt", header = FALSE,col.names = features_lbls))

##Read activity
y_train <- tbl_df(read.table("data/train/y_train.txt", header = FALSE, col.names = c("Activity")))
### Bind Activity to Main Data Set
main <- bind_cols(x_train,y_train)

##Read Person Ids
subject_train <- tbl_df(read.table("data/train/subject_train.txt", header = FALSE, col.names = c("Person Id")))
### Bind Person id  to Main Data Set
main <- bind_cols(main, subject_train)
###########################################################################
##Read Body Triaxial acceleration from the accelerometer
###Read X Axis
####Create Name Vector
body_acc_x_train_names <- c()
for (i in 1:128){body_acc_x_train_names[i] <- "body_acc_x"}
####Make Syntactically Valid Names
body_acc_x_train_names <- make.names(body_acc_x_train_names, unique = TRUE)
####Read X
body_acc_x_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_x_train.txt", col.names = body_acc_x_train_names))
####Bind Body X acceleration to Main Data Set
main <- bind_cols(main, body_acc_x_train)

###Read Y Axis
####Create Name Vector
body_acc_y_train_names <- c()
for (i in 1:128){body_acc_y_train_names[i] <- "body_acc_y"}
####Make Syntactically Valid Names
body_acc_y_train_names <- make.names(body_acc_y_train_names, unique = TRUE)
####Read Y
body_acc_y_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_y_train.txt", col.names = body_acc_y_train_names))
####Bind Body Y acceleration to Main Data Set
main <- bind_cols(main, body_acc_y_train)

###Read Z Axis
####Create Name Vector
body_acc_z_train_names <- c()
for (i in 1:128){body_acc_z_train_names[i] <- "body_acc_z"}
####Make Syntactically Valid Names
body_acc_z_train_names <- make.names(body_acc_z_train_names, unique = TRUE)
####Read Z
body_acc_z_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_z_train.txt", col.names = body_acc_z_train_names))
####Bind Body Z acceleration to Main Data Set
main <- bind_cols(main, body_acc_z_train)
########################################################################################
##Read Total Triaxial acceleration from the accelerometer
###Read X Axis
####Create Name Vector
total_acc_x_train_names <- c()
for (i in 1:128){total_acc_x_train_names[i] <- "total_acc_x"}
####Make Syntactically Valid Names
total_acc_x_train_names <- make.names(total_acc_x_train_names, unique = TRUE)
####Read X
total_acc_x_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_x_train.txt", col.names = total_acc_x_train_names))
####Bind Body X acceleration to Main Data Set
main <- bind_cols(main, total_acc_x_train)

###Read Y Axis
####Create Name Vector
total_acc_y_train_names <- c()
for (i in 1:128){total_acc_y_train_names[i] <- "total_acc_y"}
####Make Syntactically Valid Names
total_acc_y_train_names <- make.names(total_acc_y_train_names, unique = TRUE)
####Read Y
total_acc_y_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_y_train.txt", col.names = total_acc_y_train_names))
####Bind Body Y acceleration to Main Data Set
main <- bind_cols(main, total_acc_y_train)

###Read Z Axis
####Create Name Vector
total_acc_z_train_names <- c()
for (i in 1:128){total_acc_z_train_names[i] <- "total_acc_z"}
####Make Syntactically Valid Names
total_acc_z_train_names <- make.names(total_acc_z_train_names, unique = TRUE)
####Read Z
total_acc_z_train <- tbl_df(read.table("data/train/Inertial Signals/total_acc_z_train.txt", col.names = total_acc_z_train_names))
####Bind Body Z acceleration to Main Data Set
main <- bind_cols(main, total_acc_z_train)

########################################################################################
##Read Triaxial Angular velocity from the gyroscope
###Read X Axis
####Create Name Vector
body_gyro_x_train_names <- c()
for (i in 1:128){body_gyro_x_train_names[i] <- "body_gyro_x"}
####Make Syntactically Valid Names
body_gyro_x_train_names <- make.names(body_gyro_x_train_names, unique = TRUE)
####Read X
body_gyro_x_train <- tbl_df(read.table("data/train/Inertial Signals/body_gyro_x_train.txt", col.names = body_gyro_x_train_names))
####Bind Body X acceleration to Main Data Set
main <- bind_cols(main, body_gyro_x_train)

###Read Y Axis
####Create Name Vector
body_gyro_y_train_names <- c()
for (i in 1:128){body_gyro_y_train_names[i] <- "body_gyro_y"}
####Make Syntactically Valid Names
body_gyro_y_train_names <- make.names(body_gyro_y_train_names, unique = TRUE)
####Read Y
body_gyro_y_train <- tbl_df(read.table("data/train/Inertial Signals/body_gyro_y_train.txt", col.names = body_gyro_y_train_names))
####Bind Body Y acceleration to Main Data Set
main <- bind_cols(main, body_gyro_y_train)

###Read Z Axis
####Create Name Vector
body_acc_z_train_names <- c()
for (i in 1:128){body_acc_z_train_names[i] <- "body_acc_z"}
####Make Syntactically Valid Names
body_acc_z_train_names <- make.names(body_acc_z_train_names, unique = TRUE)
####Read Z
body_acc_z_train <- tbl_df(read.table("data/train/Inertial Signals/body_acc_z_train.txt", col.names = body_acc_z_train_names))
####Bind Body Z acceleration to Main Data Set
main <- bind_cols(main, body_acc_z_train)
