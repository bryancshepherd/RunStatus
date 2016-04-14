library(RCurl)
library(devtools)
library(PastebinAPI) #install_git("https://github.com/troyhill/Pastebin-API.git")

user_info = read.csv("/Users/bryanshepherd/Projects/RunStatus/user_info.txt", header = FALSE, stringsAsFactors = FALSE)

api_dk = user_info[1,1]
api_un = user_info[2,1]
api_up = user_info[3,1]

session_key <- getUserKey(api_dk, api_un, api_up)

pbPost(session_key = session_key, 
       api_dev_key = api_dk, 
       text = "Pasted from R", 
       title = "Take me out", 
       expire = "10M",
       privacy_code = "0")
