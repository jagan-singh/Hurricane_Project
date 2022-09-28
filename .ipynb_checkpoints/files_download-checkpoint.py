import pandas as pd

# Loading first file
df = pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d1950_c20210803.csv.gz', compression = 'gzip')

# Using a loop to download and concatenate other files with same pattern names
years1 = list(range(1951, 1972))
years2 = list(range(1972, 2014))

# First types of files
for i in range(len(years1)):
    temp_df = pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d' + str(years1[i]) +'_c20210803.csv.gz', compression = 'gzip', low_memory=False)
    df = pd.concat([df, temp_df], ignore_index=True)
    
# Second type of files
for i in range(len(years2)):
    temp_df = pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d' + str(years2[i]) +'_c20220425.csv.gz', compression = 'gzip', low_memory=False)
    df = pd.concat([df, temp_df], ignore_index=True)
    
# Files without a pattern in the names are downloaded and concatenated separately
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2014_c20220719.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2015_c20220425.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2016_c20220719.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2017_c20220719.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2018_c20220425.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2019_c20220425.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2020_c20220816.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2021_c20220921.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)
df = pd.concat([df, pd.read_csv('https://www.ncei.noaa.gov/pub/data/swdi/stormevents/csvfiles/StormEvents_details-ftp_v1.0_d2022_c20220921.csv.gz', compression = 'gzip', low_memory=False)], ignore_index=True)