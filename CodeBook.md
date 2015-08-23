# sourced the data from the given url

# loaded the data - x, both test and training and merged them using rbind
# followed the same process for subject (ID) and y (activity)

# loaded the activity labels data and stored it in a table

# loaded the features data and selected the indices for mean and std 
# truncated the merged x data (x_merged) to take only the columns for the mean and std measures using the indices vector from the features table

# merged the sub_merged, y_merged, and x_trunc data to obtain the merged data 

# using the melt and cast functions in the reshape2 package arrived at the mean measure for the variable values in the merged dataset
