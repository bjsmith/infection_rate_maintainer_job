library(RCurl)
library(googlesheets4)
gs4_deauth()
#download
manual_corrections <- read_sheet("1hkpfinHpxT1KcTI8umh55aaiFug12jKKSMZoae4ttlA")
ftp_pass <- Sys.getenv("webhostftppass")

#open connection
ftp_url <- paste0(
  "ftp://nzborderriskproject:",
  ftp_pass,
  "@files.000webhost.com/public_html/manual_update_cache.csv"
)
# ftp_conn <- url(description = ftp_url,open = "wb")
# close(ftp_conn)

# write.csv(manual_corrections,ftp_conn)
# 
# manual_corrections_text<-write.table(data.frame(manual_corrections), file=textConnection("csvData", "w"), row.names=FALSE, col.names=FALSE, sep=";")
# zz <- textConnection("foo", "w")
# cat(zz)
# write.table(data.frame(manual_corrections), file=zz, row.names=FALSE, col.names=FALSE, sep=";")

#save the file
write.csv(manual_corrections,file="manual_connections_local.csv")

#upload to 000webhost
ftpUpload("manual_connections_local.csv", 
          ftp_url
)

#readr::read_csv("https://nzborderriskproject.000webhostapp.com/manual_update_cache.csv")

#https://devcenter.heroku.com/articles/config-vars#accessing-config-var-values-from-code
#get password

