best <- function(state, outcome) {
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
      data[,2]<-as.numeric(data[,2])
      min<-which(data[,2]==min(data[,2]))
      req<-data[min,1]
      req<-sort(req)
      print(req[1])
}