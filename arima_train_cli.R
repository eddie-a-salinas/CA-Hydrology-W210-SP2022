#!/usr/bin/env Rscript

ts_file=""
args = commandArgs(trailingOnly=TRUE)
if (length(args)!=1) {
	stop("Expected a single argument <IN_FILE> !")
	}
ts_file=args[1]

#load libraries
library("tictoc")
library("forecast")

getCatDefFiles=function() {
    paths="catdef_extraction/catdef.catdef_row.*.col.*.csv"
    the_files=Sys.glob(paths)
    return(the_files)    
}

getTSDataFromFile=function(in_file,num_test=0,num_rows_train=144) {
    cdd=read.delim(in_file,header=TRUE)
    if(dim(cdd)[1]!=168) {
        stop(paste("Read ",length(cdd)," rows of data, but expected 168 rows of data!"))
    }
    num_rows_tot=num_rows_train+num_test
    cdd_for_ts=cdd[1:num_rows_tot,]
    cddts=ts(cdd_for_ts, start=c(2003,1),frequency=12) 
    return(cddts)    
}


trainAutoArima=function(cd_ts) {
    fit=auto.arima(cd_ts)
    npar <- length(fit$coef[fit$mask]) + 1
    nstar <- length(fit$residuals) - fit$arma[6] - fit$arma[7]*fit$arma[5]
    fit.aic <- fit$aic
    fit.bic <- fit.aic + npar * (log(nstar) - 2)
    fit.aicc <- fit.aic + 2 * npar * (nstar/(nstar - npar - 1) - 1) 
    fit_result=list(
        fit=fit    
        )
    return(fit_result)
}

getRDataPath=function(ts_file) {
    rdp=paste(ts_file,".RData",sep="")
    return(rdp)
}
getPredPath=function(ts_file) {
    pfpath=paste(ts_file,".preds.csv",sep="")
    return(pfpath)
}

megaTrain=function(ts_file) {
    rdata_file=getRDataPath(ts_file)
    pred_file=getPredPath(ts_file)
    if(file.exists(rdata_file) && file.exists(pred_file)) {
        print(paste("For file ",ts_file," found its pred/RData files so not re-computing!",sep=""))
        return(FALSE)
    }
    arima_fits=list()
    arima_preds_big_df=0
    print(paste("Generating models for ",ts_file,sep=""))
    for(num_test in 0:24) {
        tsd=getTSDataFromFile(ts_file,num_test=num_test)
        arima_fit=trainAutoArima(tsd)
        arima_fits=append(arima_fits,arima_fit)
        arima_forecast=forecast(tsd,h=1)
        arima_forecast_df=data.frame(arima_forecast)
        if(is.numeric(arima_preds_big_df)) {
            #if first preds, init
            arima_preds_big_df=arima_forecast_df
        } else {
            #if non-first preds, then append
            arima_preds_big_df=rbind(arima_preds_big_df,arima_forecast_df)
        }
    }
    print(paste("Writing data to ",rdata_file," and ",pred_file,sep=""))
    #write data file
    save(arima_fits,file = rdata_file)
    #write the DF
    write.table(arima_preds_big_df,pred_file,sep=",",row.names=FALSE,col.names=TRUE)
    return(TRUE)
}

megaTrain(ts_file)
