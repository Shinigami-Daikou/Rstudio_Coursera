rankall <- function(outcome, num = "best") {
      data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      state <- levels(factor(data[, 7]))
      hospital <- vector() 
      
      for (i in seq(state)) {
            hospital[i] <- rankhospital(state[i], outcome, num)
      }
      data.frame(hospital, state)
}