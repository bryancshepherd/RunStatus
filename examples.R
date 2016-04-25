# Set a new status
newStatus = setRunStatus(updatedStatus = 'testing')

# Now we send it the same status so nothing is actually sent to twitter
newStatus = setRunStatus(newStatus, updatedStatus = 'testing')

# Actually change the status
newStatus = setRunStatus(newStatus, updatedStatus = 'testing again')

# Better yet, use the wrappers
setStatusWorking()

setStatusDone()

# Get rid of a batch of previous tweets
cleanupTimeline()