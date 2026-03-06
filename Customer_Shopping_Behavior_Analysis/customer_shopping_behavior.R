library(tidyverse)
library(readxl)
customer <- read_xlsx("E:/Data Anyltics Projects/COURSERA/customer demographics projoect/customer_shopping_behavior.xlsx")
as_tibble(customer)
attach(customer)
glimpse(customer)
view(customer)
summary(customer)
colMeans(is.na(customer))  #review rating have missing vaule
#filling those ratings

customer <- customer  %>% 
  group_by(Category) %>% 
  mutate(`Review Rating` = replace(`Review Rating`,
                                   is.na(`Review Rating`),
                                   median(`Review Rating`,na.rm = TRUE) )) %>%
  ungroup()

# renaming columns names
#lowercase
colnames(customer) <- tolower(colnames(customer))
#space to underscore
colnames(customer) <- gsub(" ","_",colnames(customer))
#view column names
colnames(customer)
#remove (usd) from purchase_amount_(usd)

customer <- customer %>% 
  rename(purchase_amount = `purchase_amount_(usd)`)
#to check names
colnames(customer)
#create column age group of 4 ie... young_adult,aduld , Middle age , senior 
customer <- customer %>% 
  mutate(
    age_group =cut(
      age,
      breaks = 4,
      labels= c("Young Adult","Adult","Middle-aged","Senior"),
      include.lowest = TRUE
    )
  )

#to view unique values of frequency_of_purchases
customer %>% 
distinct(frequency_of_purchases)
#map frequency_of_purchases to  numbers 
customer <- customer %>% 
  mutate(purchases_frequency_days = case_when(
    frequency_of_purchases == "Fortnightly"  ~ 14,
    frequency_of_purchases == "Weekly"   ~ 7,
    frequency_of_purchases == "Annually" ~ 365,
    frequency_of_purchases == "Quarterly" ~ 90,
    frequency_of_purchases == "Bi-Weekly" ~ 14,
    frequency_of_purchases == "Monthly" ~ 30,
    frequency_of_purchases == "Every 3 Months" ~ 90,
    TRUE ~ NA_real_
  ))
#checking mapping of frequency of purchases
customer %>% 
  select(purchases_frequency_days,frequency_of_purchases) %>% 
  head(10)
#checking similarity in discount_applied and promo_code_used column
customer %>% 
  select(discount_applied,promo_code_used) %>% 
  head(10)
all(customer$discount_applied==customer$promo_code_used)
#both are same
#so delete promo_code
customer<- customer %>% 
  select(-promo_code_used)
#to check if promo code used column doped
colnames(customer)
#setting working directory for cleaned data set to save 
setwd("E:/Data Anyltics Projects/COURSERA/customer demographics projoect")

# downloading this clen dataset to select directory
write_csv(customer,"cleaned_dataset.csv")

# add to bigquery
install.packages("bigrquery")
library(bigrquery)
# Authenticate using your Google account
bq_auth()
#Specify your project and dataset
project_id <- "customer-shopping-behaviour"        # Replace with your Google Cloud Project ID
dataset_id <- "customer_shopping_behaviour"          # Replace with your BigQuery dataset
table_name <- "cleaned_Shopping_dataset"              # Table name in BigQuery
#Upload a data frame from R to BigQuery
# Upload the data frame 'd'
customer <- customer %>% select(customer_id,age,gender,item_purchased,category,purchase_amount,location,size,color,season,review_rating,
                                subscription_status,shipping_type,discount_applied,previous_purchases,payment_method,frequency_of_purchases,
                                age_group,purchases_frequency_days)

bq_table_upload(
  x = bq_table(project_id, dataset_id, table_name),
  values = customer,
  create_disposition = "CREATE_IF_NEEDED",  # Create table if it doesn’t exist
  write_disposition = "WRITE_TRUNCATE"      # Overwrite table if it exists
)
#Verify the upload
bq_table_download(
  bq_table(project_id, dataset_id, table_name),
  n_max = 10
)































