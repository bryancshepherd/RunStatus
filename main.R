library("twitteR")

user_info = read.csv("/Users/bryanshepherd/Projects/RunStatus/user_info.txt", header = FALSE, stringsAsFactors = FALSE)

consumer_key = user_info[1,1]
consumer_secret = user_info[2,1]
access_token = user_info[3,1]
access_secret = user_info[4,1]
  
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

setRunStatus = function(currentStatus = NULL, updatedStatus) {
  if (is.null(currentStatus)) {

    newStatus = updateStatus(updatedStatus)
    return(newStatus)
    
  } else if (currentStatus$text == updatedStatus) {

    return(currentStatus)
    
  } else {
    
    cs = userTimeline('Texxors', 1)
    deleteStatus(cs[[1]])
    
    newStatus = updateStatus(updatedStatus)
    return(newStatus)
  }
}


