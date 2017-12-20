#epa on whole training set

#summary
summary(train)

#str()
str(train)


#check missing value on the whole training set
print(sapply(train,function(x)sum(is.na(x))))



##boxplot of ratio
boxplot(train$orig_destination_distance,xlab="boxplot of orig_destination_distance")
boxplot(train$orig_destination_distance,xlab="boxplot of srch_adults_cnt")
boxplot(train$orig_destination_distance,xlab="boxplot of srch_children_cnt")
boxplot(train$orig_destination_distance,xlab="boxplot of srch_rm_cnt")


###hist of nominal 
#hist()
min(train$site_name);
max(train$site_name);
bins=seq(min(train$site_name),max(train$site_name),1);
hist(train$site_name,freq=FALSE,breaks=bins,main="Histogram of site_name")


min(train$posa_continent);
max(train$posa_continent);
bins=seq(min(train$posa_continent),max(train$posa_continent),1);
hist(train$posa_continent,freq=FALSE,breaks=bins,main="Histogram of posa_continent")

min(train$user_location_country);
max(train$user_location_country);
bins=seq(min(train$user_location_country),max(train$user_location_country),1);
hist(train$user_location_country,freq=FALSE,breaks=bins,main="Histogram of user_location_country")

min(train$user_location_region);
max(train$user_location_region);
bins=seq(min(train$user_location_region),max(train$user_location_region),1);
hist(train$user_location_region,freq=FALSE,breaks=bins,main="Histogram of user_location_region")

min(train$user_location_city);
max(train$user_location_city);
bins=seq(min(train$user_location_city),max(train$user_location_city),1);
hist(train$user_location_city,freq=FALSE,breaks=bins,main="Histogram of user_location_city")


hist(train$is_mobile,freq=FALSE,main="Histogram of is_mobile")

hist(train$is_package,freq=FALSE,main="Histogram of is_package")

min(train$channel);
max(train$channel);
bins=seq(min(train$channel),max(train$channel),1);
hist(train$channel,freq=FALSE,breaks=bins,main="Histogram of channel")

min(train$srch_destination_id);
max(train$srch_destination_id);
bins=seq(min(train$srch_destination_id),max(train$srch_destination_id),1);
hist(train$srch_destination_id,freq=FALSE,breaks=bins,main="Histogram of srch_destination_id")

min(train$srch_destination_type_id);
max(train$srch_destination_type_id);
bins=seq(min(train$srch_destination_type_id),max(train$srch_destination_type_id),1);
hist(train$srch_destination_type_id,freq=FALSE,breaks=bins,main="Histogram of srch_destination_type_id")

min(train$hotel_continent);
max(train$hotel_continent);
bins=seq(min(train$hotel_continent),max(train$hotel_continent),1);
hist(train$hotel_continent,freq=FALSE,breaks=bins,main="Histogram of hotel_continent")

min(train$hotel_country);
max(train$hotel_country);
bins=seq(min(train$hotel_country),max(train$hotel_country),1);
hist(train$hotel_country,freq=FALSE,breaks=bins,main="Histogram of hotel_country")

min(train$hotel_market);
max(train$hotel_market);
bins=seq(min(train$hotel_market),max(train$hotel_market),1);
hist(train$hotel_market,freq=FALSE,breaks=bins,main="Histogram of hotel_market")

hist(train$is_booking,freq=FALSE,main="Histogram of is_booking")

min(train$hotel_cluster);
max(train$hotel_cluster);
bins=seq(min(train$hotel_cluster),max(train$hotel_cluster),1);
hist(train$hotel_cluster,freq=FALSE,breaks=bins,main="Histogram of hotel_cluster")


