corr<-function(directory,threshold=0){
      source('complete.R')
      all<-complete(directory,1:332)
      above<-all[all$nobs>threshold,1]
      fi<-list.files(path = directory,full.names = TRUE)
      c <- rep(NA,length(above))
      for(i in above){
            s<-read.csv(fi[i])
            valid <- complete.cases(s)
            sdata <- s[valid, 2]
            ndata <- s[valid, 3]
            c[i] <- cor(x =sdata, y = ndata)
      }
      c <- c[complete.cases(c)]
}