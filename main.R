library(RCurl)
library(devtools)
library(PastebinAPI) #install_git("https://github.com/troyhill/Pastebin-API.git")



session_key <- getUserKey(api_dk, api_un, api_up)

pbPost(session_key = session_key, 
       api_dev_key = api_dk, 
       text = "Pasted from R", 
       title = "Take me out", 
       expire = "10M",
       privacy_code = "0")
