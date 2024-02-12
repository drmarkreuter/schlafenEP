library(tuneR)
imagetagA <- "<img src='"
imagetagB <- "' alt='wavplot' width='300px'>"

wd <- setwd("~/AbominableSchlafen")

mp3dir <- paste0(wd,'/mp3')
mp3dir

mp3files <- list.files(mp3dir,pattern = ".mp3",full.names = TRUE)
mp3files

mp3 <- tuneR::readMP3(mp3files[1])
mp3fname <- unlist(strsplit(mp3files[1],"/"))
mp3fname <- mp3fname[length(mp3fname)]
par(bg=NA) #for png with  transparent background
plot(mp3,
     col = 'antiquewhite',
     main = mp3fname)


#loop through mp3 files
# for (i in 1:length(mp3files)){
#   fname <- mp3files[i]
#   print(fname)
#   fnameTrim <- unlist(strsplit(fname,"\\."))[1]
#   print(fnameTrim)
#   mp3 <- tuneR::readMP3(fname)
#   imagefname <- paste0(fnameTrim,".png") 
#   par(bg=NA)
#   png(imagefname)
#   tuneR::plot(mp3)
#   dev.off()
#   
# }

for (i in 1:length(mp3files)){
  fname <- mp3files[i]
  print(fname)
  fnameTrim <- unlist(strsplit(fname,"\\."))[1]
  print(fnameTrim)
  mp3 <- tuneR::readMP3(fname)
  
  mp3fname <- unlist(strsplit(fname,"/"))
  mp3fname <- mp3fname[length(mp3fname)]
  
  imagefname <- paste0(fnameTrim,".png") 
  par(bg=NA) #for png with  transparent background
  tuneR::plot(mp3,
              col = 'antiquewhite',
              main = mp3fname)
  dev.copy(png,imagefname)
  dev.off()
  
}

imagehtmlvector <- vector()
for (i in 1:length(mp3files)){
  fname <- mp3files[i]
  print(fname)
  fnameTrim <- unlist(strsplit(fname,"\\."))[1]
  imagefname <- paste0(fnameTrim,".png") 
  
  imagehtmlvector[i] <- paste0(imagetagA,
                               imagefname,
                               imagetagB)
  
}

imagehtmlvector
writeLines(imagehtmlvector,
           paste0(wd,"/imageHTML.txt"))

