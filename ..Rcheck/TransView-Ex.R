pkgname <- "TransView"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('TransView')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("DensityContainer-class")
### * DensityContainer-class

flush(stderr()); flush(stdout())

### Name: DensityContainer-class
### Title: Class '"DensityContainer"'
### Aliases: DensityContainer-class class:DensityContainer
###   show,DensityContainer-method ex_name,DensityContainer-method ex_name
###   ex_name<-,DensityContainer-method ex_name<-
###   origin,DensityContainer-method origin spliced,DensityContainer-method
###   spliced<-,DensityContainer-method spliced<- spliced
###   paired,DensityContainer-method paired
###   readthrough_pairs,DensityContainer-method readthrough_pairs
###   filtered,DensityContainer-method filtered
###   strands,DensityContainer-method strands
###   nreads,DensityContainer-method nreads
###   gcoverage,DensityContainer-method gcoverage
###   maxScore,DensityContainer-method maxScore
###   lowqual,DensityContainer-method lowqual
###   paired_reads,DensityContainer-method paired_reads
###   proper_pairs,DensityContainer-method proper_pairs
###   collapsed,DensityContainer-method collapsed
###   compression,DensityContainer-method compression
###   chromosomes,DensityContainer-method chromosomes
###   filtered_reads,DensityContainer-method filtered_reads
###   pos,DensityContainer-method pos neg,DensityContainer-method neg
###   lcoverage,DensityContainer-method lcoverage
###   lmaxScore,DensityContainer-method lmaxScore
###   fmapmass,DensityContainer-method fmapmass
###   data_pointer,DensityContainer-method data_pointer
###   env,DensityContainer-method env size,DensityContainer-method size
###   lsize,DensityContainer-method lsize gsize,DensityContainer-method
###   gsize
### Keywords: classes

### ** Examples

showClass("DensityContainer")



cleanEx()
nameEx("TVResults-class")
### * TVResults-class

flush(stderr()); flush(stdout())

### Name: TVResults-class
### Title: Class '"TVResults"'
### Aliases: TVResults-class class:TVResults show,TVResults-method
###   parameters,TVResults-method parameters clusters,TVResults-method
###   clusters cluster_order,TVResults-method cluster_order
###   scores_peaks,TVResults-method scores_peaks
###   scores_rna,TVResults-method scores_rna summaryTV
###   summaryTV,TVResults-method
### Keywords: classes

### ** Examples

showClass("TVResults")



cleanEx()
nameEx("TransView-package")
### * TransView-package

flush(stderr()); flush(stdout())

### Name: TransView-package
### Title: Read density map construction and accession. Visualization of
###   ChIPSeq and RNASeq data sets.
### Aliases: TransView-package TransView
### Keywords: package

### ** Examples

#see vignette



cleanEx()
nameEx("annotatePeaks")
### * annotatePeaks

flush(stderr()); flush(stdout())

### Name: annotatePeaks
### Title: Associates peaks to TSS
### Aliases: annotatePeaks

### ** Examples


exgtf<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="gtf.gz$")[2]
exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

GTF<-gtf2gr(exgtf)
peaks<-macs2gr(exls,psize=500)
apeaks<-annotatePeaks(peaks=peaks,gtf=GTF)
apeaks.gb<-annotatePeaks(peaks=peaks,gtf=GTF,reference="gene_body")




cleanEx()
nameEx("gtf2gr")
### * gtf2gr

flush(stderr()); flush(stdout())

### Name: gtf2gr
### Title: GTF file parsing
### Aliases: gtf2gr

### ** Examples


exgtf<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="gtf.gz$")

GTF.mm9<-gtf2gr(exgtf[2])

head(GTF.mm9)




cleanEx()
nameEx("macs2gr")
### * macs2gr

flush(stderr()); flush(stdout())

### Name: macs2gr
### Title: Convenience function for MACS output conversion
### Aliases: macs2gr

### ** Examples


exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

peaks<-macs2gr(exls,psize=500)
head(peaks)




cleanEx()
nameEx("meltPeak")
### * meltPeak

flush(stderr()); flush(stdout())

### Name: meltPeak
### Title: Convenience function which returns a data frame with normalized
###   peak densities suitable for plotting with ggplot2
### Aliases: meltPeak

### ** Examples


exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")
exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")
exgtf<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="gtf.gz$")[2]
fn.macs<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

exden.ctrl<-parseReads(exbam[1],verbose=0)
exden.chip<-parseReads(exbam[2],verbose=0)

peaks<-macs2gr(exls,psize=500)

GTF<-gtf2gr(exgtf)
peaks<-macs2gr(fn.macs,psize=500)
peaks.anno<-annotatePeaks(peaks=peaks,gtf=GTF)

peak1.df<-meltPeak(exden.chip,region=peaks.anno["Peak.1"],bin_method="mean",peak_windows=100,rpm=TRUE)
head(peak1.df)




cleanEx()
nameEx("parseReads")
### * parseReads

flush(stderr()); flush(stdout())

### Name: parseReads
### Title: User configurable efficient assembly of read density maps
### Aliases: parseReads

### ** Examples


exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")

#store density maps of the whole sam/bam file in test_data
exden.chip<-parseReads(exbam[2],verbose=0)

#display basic information about the content of test.sam 
exden.chip

#all data are easily accessible
test_stat<-tvStats(exden.chip)
test_stat$origin

# histogram of hwindow sized windows
## Not run: histogram(exden.chip)




cleanEx()
nameEx("peak2tss")
### * peak2tss

flush(stderr()); flush(stdout())

### Name: peak2tss
### Title: Changes the peak center to the next TSS according to previous
###   annotation
### Aliases: peak2tss

### ** Examples


exgtf<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="gtf.gz$")[2]
fn.macs<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

GTF<-gtf2gr(exgtf)
peaks<-macs2gr(fn.macs,psize=500)

peaks.anno<-annotatePeaks(peaks=peaks,gtf=GTF)

peak2tss(peaks.anno, GTF, peak_len=500)




cleanEx()
nameEx("plotTV")
### * plotTV

flush(stderr()); flush(stdout())

### Name: plotTV
### Title: Plot and cluster global read densities
### Aliases: plotTV

### ** Examples


exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")
exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

exden.ctrl<-parseReads(exbam[1],verbose=0)
exden.chip<-parseReads(exbam[2],verbose=0)

peaks<-macs2gr(exls,psize=500)

cluster_res<-plotTV(exden.chip,exden.ctrl,regions=peaks,cluster=5,norm_readc=FALSE,showPlot=FALSE)
summary(cluster_res)




cleanEx()
nameEx("plotTVData")
### * plotTVData

flush(stderr()); flush(stdout())

### Name: plotTVData
### Title: Summarize plotTV results
### Aliases: plotTVData plotTVData-methods plotTVData,TVResults
###   plotTVData,TVResults-method

### ** Examples


exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")
exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

exden.ctrl<-parseReads(exbam[1],verbose=0)
exden.chip<-parseReads(exbam[2],verbose=0)

peaks<-macs2gr(exls,psize=500)

cluster_res<-plotTV(exden.chip,exden.ctrl,regions=peaks,cluster=5,norm_readc=FALSE,showPlot=FALSE)
summaryTV(cluster_res)
tvdata<-plotTVData(cluster_res)





cleanEx()
nameEx("rmTV")
### * rmTV

flush(stderr()); flush(stdout())

### Name: rmTV
### Title: Free space occupied by DensityContainer
### Aliases: rmTV rmTV-methods rmTV,DensityContainer-method

### ** Examples

exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")

#store density maps of the whole sam/bam file in test_data
exden.chip<-parseReads(exbam[2])

rmTV(exden.chip)



cleanEx()
nameEx("slice1")
### * slice1

flush(stderr()); flush(stdout())

### Name: slice1
### Title: Slice read densities from a TransView dataset
### Aliases: slice1 sliceN slice1-methods sliceN-methods
###   slice1,DensityContainer,character,numeric,numeric-method
###   sliceN,DensityContainer-method

### ** Examples


exbam<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="bam$")
exls<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="xls$")

#store density maps of the whole sam/bam file in test_data
exden.ctrl<-parseReads(exbam[1],verbose=0)
exden.chip<-parseReads(exbam[2],verbose=0)

peaks<-macs2gr(exls,psize=500)

#returns vector of read counts per base pair
slice1(exden.chip,"chr2",30663080,30663580)[300:310]
slice1(exden.ctrl,"chr2",30663080,30663580)[300:310]
slice1(exden.chip,"chr2",30663080,30663580,control=exden.ctrl,treads_norm=FALSE)[300:310]

xout<-sliceN(exden.chip,ranges=peaks)
lapply(xout,function(x)sum(x)/length(x))
xout<-sliceN(exden.ctrl,ranges=peaks)
lapply(xout,function(x)sum(x)/length(x))
xout<-sliceN(exden.chip,ranges=peaks,control=exden.ctrl,treads_norm=FALSE)
lapply(xout,function(x)sum(x)/length(x))





cleanEx()
nameEx("slice1T")
### * slice1T

flush(stderr()); flush(stdout())

### Name: slice1T
### Title: Slice read densities of whole transcripts from a TransView
###   DensityContainer
### Aliases: slice1T sliceNT slice1T-methods sliceNT-methods
###   slice1T,DensityContainer,character-method
###   sliceNT,DensityContainer,character-method

### ** Examples


library("pasillaBamSubset")

exgtf<-dir(system.file("extdata", package="TransView"),full=TRUE,patt="gtf.gz$")[1]
fn.pas_paired<-untreated1_chr4()

exden.exprs<-parseReads(fn.pas_paired,spliced=TRUE,verbose=0)

GTF.dm3<-gtf2gr(exgtf)

slice1T(exden.exprs,tname="NM_001014688",gtf=GTF.dm3,concatenate=FALSE)

my_genes<-sliceNT(exden.exprs,unique(mcols(GTF.dm3)$transcript_id[101:150]),gtf=GTF.dm3)
lapply(my_genes,function(x)sum(x)/length(x))





### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
