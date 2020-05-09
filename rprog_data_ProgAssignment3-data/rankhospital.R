rankhospital <- function(state, outcome, num = "best") {
      ## Read outcome data
      ## Check that state and outcome are valid
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      all_data<-read.csv("outcome-of-care-measures.csv")
      if((state %in% all_data$State) == FALSE){
            stop(print("invalid state"))
      }
      else if(!(outcome %in% c("Heart Failure", "Heart Attack","Pneumonia"))){
            stop(print("invalid outcome"))
      }
      
      
      if (outcome == "Heart Attack") {
            outcome_column <- 11
      }
      else if (outcome == "Heart Failure") {
            outcome_column <- 17
      }
      else {
            outcome_column <- 23
      }
      
      state_data <- all_data[all_data$State==state,c(2,outcome_column)]
      data<-state_data[!(state_data[,2]=='Not Available'),1:2]
      
      if(ncol(data)>num){
            print(NA)
            stop()
      }
      data[,2]<-as.numeric(data[,2])
      req_data <- data[order(data[2],data[1]),1:2]
      #req_data<-data[order(data[2],data[1]),1:2]
      if (is.character(num) == TRUE) {
            if (num == "best") {
                  num = 1
            }
            else if (num == "worst") {
                  num = length(req_data[,2])
            }
      }
      #return the hospital name with the outcome ranking of num
      print(req_data[num, 1])
      
}