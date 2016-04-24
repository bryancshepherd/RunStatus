library("twitteR")

user_info = read.csv("/Users/bryanshepherd/Projects/RunStatus/user_info.txt", header = FALSE, stringsAsFactors = FALSE)

consumer_key = user_info[1,1]
consumer_secret = user_info[2,1]
access_token = user_info[3,1]
access_secret = user_info[4,1]
  
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

setRunStatus = function(currentStatus = NULL, updatedStatus) {
  
  if (is.null(currentStatus) || # The double or ('||') means that if the first element
                                # evaluates FALSE it skips to the next one. This
                                # prevent errors for objects that don't exist and such
      (!(is.null(currentStatus)) && 
       !(currentStatus$text == updatedStatus))) {
    
    cleanupTimeline()
    
    newStatus = updateStatus(updatedStatus)
    return(newStatus)
    
  } else { # This is the path for when the passed current status matches the 
           # updated status. This prevents uneccessary Twitter API calls

    return(currentStatus)
    
  } 
}

cleanupTimeline = function() {
  # Note that this will return success even if there are no tweets in the timeline
  tl = userTimeline('Texxors')
  res = lapply(tl, deleteStatus)
  if (length(res)>0) {
    ifelse(all(do.call(cbind, res))==TRUE, return('Succeeded'), return('Failed'))
  } else {
    return("Nothing to delete")
  }
}

setStatusWorking = function() {
  setRunStatus(updatedStatus = 'Working')
}

setStatusDone = function() {
  setRunStatus(updatedStatus = 'Done')
}

