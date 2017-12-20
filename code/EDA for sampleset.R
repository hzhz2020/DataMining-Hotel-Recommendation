#EDA on our sample set

#summary
summary(train.downsize10)

#str()
str(train.downsize10)


#check missing value on our sample set
print(sapply(train.downsize10,function(x)sum(is.na(x))))


##boxplot of ratio
boxplot(train.downsize10$orig_destination_distance,xlab="boxplot of orig_destination_distance")
boxplot(train.downsize10$orig_destination_distance,xlab="boxplot of srch_adults_cnt")
boxplot(train.downsize10$orig_destination_distance,xlab="boxplot of srch_children_cnt")
boxplot(train.downsize10$orig_destination_distance,xlab="boxplot of srch_rm_cnt")




###hist of nominal 
#hist()

min(train.downsize10$site_name)
max(train.downsize10$site_name);
bins=seq(min(train.downsize10$site_name),max(train.downsize10$site_name),1);
hist(train.downsize10$site_name,freq=FALSE,breaks=bins,main= "Histogram of site_name")


min(train.downsize10$posa_continent);
max(train.downsize10$posa_continent);
bins=seq(min(train.downsize10$posa_continent),max(train.downsize10$posa_continent),1);
hist(train.downsize10$posa_continent,freq=FALSE,breaks=bins,main="Histogram of posa_continent")

min(train.downsize10$user_location_country);
max(train.downsize10$user_location_country);
bins=seq(min(train.downsize10$user_location_country),max(train.downsize10$user_location_country),1);
hist(train.downsize10$user_location_country,freq=FALSE,breaks=bins,main="Histogram of user_location_country")

min(train.downsize10$user_location_region);
max(train.downsize10$user_location_region);
bins=seq(min(train.downsize10$user_location_region),max(train.downsize10$user_location_region),1);
hist(train.downsize10$user_location_region,freq=FALSE,breaks=bins,main="Histogram of user_location_region")

min(train.downsize10$user_location_city);
max(train.downsize10$user_location_city);
bins=seq(min(train.downsize10$user_location_city),max(train.downsize10$user_location_city),1);
hist(train.downsize10$user_location_city,freq=FALSE,breaks=bins,main="Histogram of user_location_city")


hist(train.downsize10$is_mobile,freq=FALSE,main="Histogram of is_mobile")

hist(train.downsize10$is_package,freq=FALSE,main="Histogram of is_package")

min(train.downsize10$channel);
max(train.downsize10$channel);
bins=seq(min(train.downsize10$channel),max(train.downsize10$channel),1);
hist(train.downsize10$channel,freq=FALSE,breaks=bins,main="Histogram of channel")

min(train.downsize10$srch_destination_id);
max(train.downsize10$srch_destination_id);
bins=seq(min(train.downsize10$srch_destination_id),max(train.downsize10$srch_destination_id),1);
hist(train.downsize10$srch_destination_id,freq=FALSE,breaks=bins,main="Histogram of srch_destination_id")

min(train.downsize10$srch_destination_type_id);
max(train.downsize10$srch_destination_type_id);
bins=seq(min(train.downsize10$srch_destination_type_id),max(train.downsize10$srch_destination_type_id),1);
hist(train.downsize10$srch_destination_type_id,freq=FALSE,breaks=bins,main="Histogram of srch_destination_type_id")

min(train.downsize10$hotel_continent);
max(train.downsize10$hotel_continent);
bins=seq(min(train.downsize10$hotel_continent),max(train.downsize10$hotel_continent),1);
hist(train.downsize10$hotel_continent,freq=FALSE,breaks=bins,main="Histogram of hotel_continent")

min(train.downsize10$hotel_country);
max(train.downsize10$hotel_country);
bins=seq(min(train.downsize10$hotel_country),max(train.downsize10$hotel_country),1);
hist(train.downsize10$hotel_country,freq=FALSE,breaks=bins,main="Histogram of hotel_country")

min(train.downsize10$hotel_market);
max(train.downsize10$hotel_market);
bins=seq(min(train.downsize10$hotel_market),max(train.downsize10$hotel_market),1);
hist(train.downsize10$hotel_market,freq=FALSE,breaks=bins,main="Histogram of hotel_market")

hist(train.downsize10$is_booking,freq=FALSE,main= "Histogram of is_booking")

min(train.downsize10$hotel_cluster);
max(train.downsize10$hotel_cluster);
bins=seq(min(train.downsize10$hotel_cluster),max(train.downsize10$hotel_cluster),1);
hist(train.downsize10$hotel_cluster,freq=FALSE,breaks=bins,main="Histogram of hotel_cluster")

