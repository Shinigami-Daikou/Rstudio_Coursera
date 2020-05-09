rankall2 <- function(outcome, num = "best") {
      ## Read outcome data
      ## Check that state and outcome are valid
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      all_data<-read.csv("outcome-of-care-measures.csv")
      if(!(outcome %in% c("Heart Failure", "Heart Attack","Pneumonia"))){
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
      
      s<-vector()
      all_data<-split.data.frame(all_data,all_data$State)
            for(i in all_data){
                  state_data <- i[,c(2,outcome_column)]
                  data<-state_data[!(state_data[,2]=='Not Available'),1:2]
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
            
            if(num>ncol(req_data)){
                  s[length(s)+1]<-NA
            }
            else{
                  s[length(s)+1]<-req_data[num,1]
            }
      }
      t<-data.frame(s,names(all_data))
      print(t)
}