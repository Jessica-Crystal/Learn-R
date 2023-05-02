#Advanced
#manipulate data

library(tidyverse)
library(lubridate)
library(readxl)
data <- read_excel('https://www.oliviergueant.com/uploads/4/3/0/9/4309511/sbf120_as_of_end_2018.xlsx', sheet = 'Data')


price_df_list <- list()
for (i in 1:120) {
  price_data <- data[, 3*i:(3*i+1)] %>% 
    na.omit() %>% 
    mutate(Date = as_date(Date, origin = "1899-12-30")) %>% 
    rename(!!names(.)[2] := names(.)[1], Date = names(.)[1]) %>% 
    select(-names(.)[1]) %>% 
    set_names(c("Date", paste0("Price_", i))) %>% 
    as_tibble()
  price_df_list[[i]] <- price_data
}
agg_price_data <- reduce(price_df_list, full_join, by = "Date")
######################################################################
library(ggplot2)
Strategy <- function(name, returns){
  name <- name
  returns <- returns
  pnl <- cbind(c(100), 100*cumprod(1+as.matrix(returns)))
  pnl <- as.vector(pnl)
  volatility <- function(){
    return(sd(returns)*sqrt(252))
  }
  sharpe_ratio <- function(){
    return(mean(returns)*sqrt(252)/sd(returns))
  }
  max_dd <- function(){
    return(1 - min(rev(pmin(cummin(rev(pnl)), pnl))/pnl))
  }
  max_dd_2 <- function(){
    return(max(1 - pnl/pmax(cummax(pnl), na.rm = TRUE)))
  }
  return(list(name = name, returns = returns, pnl = pnl, volatility = volatility, sharpe_ratio = sharpe_ratio, max_dd = max_dd, max_dd_2 = max_dd_2))
}
