complete<-function(directory,id){
         all<-list.files(path = directory,full.names = TRUE)
         out<-data.frame()
           for(i in id){
                     s<-read.csv(all[i])
                     y<-complete.cases(s)
                     a<-length(y[y==TRUE])
                     out<-rbind(out,c(i,a))
                 }
         names(out)<-c('id','nobs')
         out
       }