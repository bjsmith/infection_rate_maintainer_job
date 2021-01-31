library(RCurl)
library(googlesheets4)
gs4_deauth()
#download
manual_corrections <- read_sheet("1hkpfinHpxT1KcTI8umh55aaiFug12jKKSMZoae4ttlA")
ftp_pass <- Sys.getenv("webhostftppass")

#upload to 000webhost
ftpUpload(manual_corrections, 
          paste0(
            "ftp://nzborderriskproject:",
            ftp_pass,
            "@files.000webhost.com/public_html/manual_update_cache.csv")
)

#readr::read_csv("https://nzborderriskproject.000webhostapp.com/manual_update_cache.csv")

#https://devcenter.heroku.com/articles/config-vars#accessing-config-var-values-from-code
#get password

