pollutantmean<-function(directory,pollutant,id){
         allFiles <- list.files(path = directory, full.names = TRUE)
         selectedData <- data.frame()
         for (i in id) {
                 selectedData <- rbind(selectedData, read.csv(allFiles[i]))
               }
         selectedData
         if (pollutant == 'sulfate') {
                 mean(selectedData$sulfate, na.rm = TRUE)
               } else if (pollutant == 'nitrate') {
                       mean(selectedData$nitrate, na.rm = TRUE)
                     }
         
             }