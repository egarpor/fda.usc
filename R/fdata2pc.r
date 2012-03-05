fdata2pc<- function(fdataobj,norm=TRUE,ncomp=2){
  C <- match.call()
if (!is.fdata(fdataobj)) stop("No fdata class")
 if (!is.fdata(fdataobj)) fdataobj<-fdata(fdataobj)
 nas1<-apply(fdataobj$data,1,count.na)
 if (any(nas1))  stop("fdataobj contain ",sum(nas1)," curves with some NA value \n")
X<-fdataobj[["data"]]
tt<-fdataobj[["argvals"]]
rtt<-fdataobj[["rangeval"]]
nam<-fdataobj[["names"]]
mm<-fdata.cen(fdataobj)
xmean<-mm$meanX
Xcen.fdata <- mm$Xcen
n <- nrow(Xcen.fdata);J <- ncol(Xcen.fdata)
Jmin<-min(c(J,n))
eigenres <- svd(Xcen.fdata$data)
lambdas <- eigenres$d^2/n
vs<-fdata(t(eigenres$v),tt,rtt,list(main="pc.svd.fdata",xlab="t",ylab="rotation"))
scores <- matrix(0,ncol=J,nrow=n)
if (norm) {
          no<-norm.fdata(vs)     #as� norma 1, con mean(norm.fdata(vs)) aprox 1
          vs$data<-sweep(vs$data,1,drop(no),"/")
          scores[,1:Jmin] <-inprod.fdata(Xcen.fdata,vs)
          }
else     {scores[,1:Jmin] <-inprod.fdata(Xcen.fdata,vs)}
#else     {scores[,1:Jmin] <-Xcen.fdata$data%*%(eigenres$v)*diff(rtt)/(J-1)}
colnames(scores)<-paste("PC",1:J, sep = "")
l<-1:ncomp
out<-list("lambdas"=lambdas[l],"rotation"=vs[l],"x"=scores,"fdataobj.cen"=Xcen.fdata,"mean"=xmean,
"l"=l,"C"=C)
class(out) = "fdata.comp"
return(out)
}
