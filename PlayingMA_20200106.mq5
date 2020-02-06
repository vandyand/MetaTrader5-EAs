
#include<Trade\Trade.mqh>
#property tester_file "test_file.csv"

CTrade trade;

input int ma_period1 = 0;
input int ma_period2 = 1;
input int ma_period3 = 0;
input int ma_period4 = 1;
//input int signalBars = 3;
//int openBars = signalBars;
input int openBars = 3;
//input double drawDown = 0.9995;
//input datetime splitDate;


bool EquityCrunch = false;
bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;
bool stopTrading = false;

int tickNum = 0;
int closeTick = 0;

double Lots = 0.01;

int maHandle1;
int maHandle2;
int maHandle3;
int maHandle4;
double mas1[1];
double mas2[1];
double mas3[1];
double mas4[1];

int OnInit(){

   maHandle1 = iMA(_Symbol,_Period,ma_period1,0,MODE_SMA,PRICE_OPEN);
   maHandle2 = iMA(_Symbol,_Period,ma_period2,0,MODE_SMA,PRICE_OPEN);
   maHandle3 = iMA(_Symbol,_Period,ma_period3,0,MODE_SMA,PRICE_OPEN);
   maHandle4 = iMA(_Symbol,_Period,ma_period4,0,MODE_SMA,PRICE_OPEN);
   
   return(INIT_SUCCEEDED);
}

void OnTick()
{   
   tickNum++;
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);

   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   //Alert("TimeCurrent: ",TimeCurrent()," splitDate: ",splitDate," Past: ",TimeCurrent() > splitDate);
   
   /*
   if(!stopTrading && TimeCurrent() > splitDate && (Equity < 1000 * drawDown || Equity < Balance * drawDown)){
      Alert("***********************************************************************");
      stopTrading = true;
      Alert("Equity: ", Equity, " Balance: ", Balance, " stopTrading: ", stopTrading);
   }
   */
   
   
   //if(Equity < Balance * 0.8){
   //   EquityCrunch = true;
   //}
   
   //double MA = iMA(_Symbol,_Period,MA_Period,0,0,0);

   
   
   /*
   
   double Open3 = iOpen(_Symbol,_Period,3);
   double Open2 = iOpen(_Symbol,_Period,2);
   double Open1 = iOpen(_Symbol,_Period,1);
   double Open = iOpen(_Symbol,_Period,0);
   //Alert("MA: ", MA);
   Alert("Open: ", Open, " Open1: ", Open1, " Open2: ", Open2);
   
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   if(Open < Open1){// && Open1 < Open2 && Open2 < Open3){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   
   if(Open > Open1){// && Open1 > Open2 && Open2 > Open3){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   */
   
   LRE1 = LRE0;
   SRE1 = SRE0;
   
   
   CopyBuffer(maHandle1,0,0,1,mas1);
   CopyBuffer(maHandle2,0,0,1,mas2);
   CopyBuffer(maHandle3,0,0,1,mas3);
   CopyBuffer(maHandle4,0,0,1,mas4);
   
   double MA1 = mas1[0];
   double MA2 = mas2[0];
   double MA3 = mas3[0];
   double MA4 = mas4[0];
   
   
   if(MA1 > MA2){
      LRE0 = true;
   } else {
      LRE0 = false;
   }
   if(MA3 < MA4){
      SRE0 = true;
   } else {
      SRE0 = false;
   }
   
   /*
   LRE0 = true;
   SRE0 = true;
   for(int i = 0; i < signalBars; i++){
      if(iOpen(_Symbol,_Period,i) > iOpen(_Symbol,_Period,i+1)){
         LRE0 = false;
      }
      if(iOpen(_Symbol,_Period,i) < iOpen(_Symbol,_Period,i+1)){
         SRE0 = false;
      }
   }
   */

   if(!LRE1 && LRE0){
      LongSignal = true;
   } else {
      LongSignal = false;
   }
   
   if(!SRE1 && SRE0){
      ShortSignal = true;
   } else {
      ShortSignal = false;
   }
   
   if(PositionsTotal() < 1 && !stopTrading){
      if(LongSignal && !ShortSignal){
         trade.Buy(Lots,NULL,Ask,0,0,NULL);
         closeTick = tickNum + openBars;
      }
      if(ShortSignal && !LongSignal){
         trade.Sell(Lots,NULL,Bid,0,0,NULL);
         closeTick = tickNum + openBars;
      }
   }
   
   if(tickNum == closeTick || stopTrading){
      CloseAllPositions();
      //trade.PositionClose(PositionGetTicket(0));
   }
}

void CloseAllPositions(){
   for(int i = PositionsTotal()-1; i >= 0; i--){
      ulong ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}

double OnTester() {

   double initial_deposit = TesterStatistics(STAT_INITIAL_DEPOSIT);
   
   double profit = TesterStatistics(STAT_PROFIT);
   //if(profit <= 0){return;}
   
   double gross_profit = TesterStatistics(STAT_GROSS_PROFIT);
   double gross_loss = TesterStatistics(STAT_GROSS_LOSS);
   double max_profit_trade = TesterStatistics(STAT_MAX_PROFITTRADE);
   double max_loss_trade = TesterStatistics(STAT_MAX_LOSSTRADE);
   
   double con_profit_max = TesterStatistics(STAT_CONPROFITMAX);
   double con_profit_max_trades = TesterStatistics(STAT_CONPROFITMAX_TRADES);
   double max_con_wins = TesterStatistics(STAT_MAX_CONWINS);
   double max_con_profit_trades = TesterStatistics(STAT_MAX_CONPROFIT_TRADES);
   double con_loss_max = TesterStatistics(STAT_CONLOSSMAX);
   double con_loss_max_trades = TesterStatistics(STAT_CONLOSSMAX_TRADES);
   double max_con_losses = TesterStatistics(STAT_MAX_CONLOSSES);
   double max_con_loss_trades = TesterStatistics(STAT_MAX_CONLOSS_TRADES);

   double balance_min = TesterStatistics(STAT_BALANCEMIN);
   double balance_dd = TesterStatistics(STAT_BALANCE_DD);
   double balance_dd_percent = TesterStatistics(STAT_BALANCEDD_PERCENT);
   double balance_dd_relative = TesterStatistics(STAT_BALANCE_DD_RELATIVE);
   double balance_drel_percent = TesterStatistics(STAT_BALANCE_DDREL_PERCENT);
   
   double equity_min = TesterStatistics(STAT_EQUITYMIN);
   double equity_dd = TesterStatistics(STAT_EQUITY_DD);
   double equity_dd_percent = TesterStatistics(STAT_EQUITYDD_PERCENT);
   double equity_dd_relative = TesterStatistics(STAT_EQUITY_DD_RELATIVE);
   double equity_drel_percent = TesterStatistics(STAT_EQUITY_DDREL_PERCENT);
   
   double expected_payoff = TesterStatistics(STAT_EXPECTED_PAYOFF);
   double profit_factor = TesterStatistics(STAT_PROFIT_FACTOR);
   double recovery_factor = TesterStatistics(STAT_RECOVERY_FACTOR);
   double sharpe_ratio = TesterStatistics(STAT_SHARPE_RATIO);
   double min_margin_level = TesterStatistics(STAT_MIN_MARGINLEVEL);
   double custom_on_tester = TesterStatistics(STAT_CUSTOM_ONTESTER);
   
   double deals = TesterStatistics(STAT_DEALS);
   double trades = TesterStatistics(STAT_TRADES);
   double profit_trades = TesterStatistics(STAT_PROFIT_TRADES);
   double loss_trades = TesterStatistics(STAT_LOSS_TRADES);
   double short_trades = TesterStatistics(STAT_SHORT_TRADES);
   double long_trades = TesterStatistics(STAT_LONG_TRADES);
   double profit_short_trades = TesterStatistics(STAT_PROFIT_SHORTTRADES);
   double profit_long_trades = TesterStatistics(STAT_PROFIT_LONGTRADES);
   double profit_trades_avg_con = TesterStatistics(STAT_PROFITTRADES_AVGCON);
   double loss_trades_avg_con = TesterStatistics(STAT_LOSSTRADES_AVGCON);


   //************************************************************************
   // GETTING REGRESSION SCORE regression, log_regression
   //************************************************************************
   

//--- custom criterion optimization value (the higher, the better)
   double regression=0.0;
//--- get trade results to the array
   double array[];
   double trades_volume;
   GetTradeResultsToArray(array,trades_volume);
   int trades_arr=ArraySize(array);
//--- if there are less than 10 trades, test yields no positive results
//   if(trades_arr<10)
//      return (0);
//--- average result per trade
   double average_pl=0;
   for(int i=0;i<ArraySize(array);i++)
      average_pl+=array[i];
   average_pl = trades_arr != 0 ? average_pl / trades_arr : 0;
//--- display the message for the single-test mode
   if(MQLInfoInteger(MQL_TESTER) && !MQLInfoInteger(MQL_OPTIMIZATION))
      PrintFormat("%s: Trades=%d, Average profit=%.2f",__FUNCTION__,trades_arr,average_pl);
//--- calculate linear regression ratios for the profit graph
   double a,b,std_error;
   double chart[];
   if(!CalculateLinearRegression(array,chart,a,b))
      Alert("Calculate Linear Regression function Faulted!!!******************************");
      //return (0);
//--- calculate the error of the chart deviation from the regression line
   if(!CalculateStdError(chart,a,b,std_error))
      Alert("Calculate Standard Error function Faulted!!!********************************");
      //return (0);
//--- calculate the ratio of trend profits to the standard deviation
   regression=std_error != 0 ? a*trades_arr/std_error : 0;


   //************************************************************************
   // GETTING SYSTEM QUALITY NUMBER sqn
   //************************************************************************

   double win_pct = trades > 0 ? profit_trades / trades : 0;
	double loss_pct = trades > 0 ? loss_trades / trades : 0;
	
	double avg_win = profit_trades > 0 ? gross_profit / profit_trades : 0;
	double avg_loss = loss_trades > 0 ? gross_loss / loss_trades : 0;
	
	double expectancy = (win_pct * avg_win) + (loss_pct * avg_loss);
	
	double avg_trade = trades > 0 ? profit / trades : 0;
	
	double sumsqrs = 0.0;
	
   datetime from_date = D'1970.01.01';
   datetime to_date = D'2020.01.01';
   HistorySelect(from_date,to_date);
	Alert("HistoryDealsTotal(): ",HistoryDealsTotal(),"*********************************");
	
	for(int i = 2;i<HistoryDealsTotal(); i+=2) {
      double profit_ = HistoryDealGetDouble(HistoryDealGetTicket(i),DEAL_PROFIT);
      sumsqrs += MathPow(profit_ - avg_trade,2);
      Alert("profit: ",profit_," sumsqrs: ",sumsqrs);
   }
   
   double st_dev = MathPow(sumsqrs,0.5);
		
	double sqn = st_dev > 0 ? sqrt(trades) * expectancy / st_dev : 0;
	
	//Alert("Win pct: ",win_pct," win avg: ",avg_win," loss pct: ",loss_pct," loss_avg: ",avg_loss);
   //Alert("Std Dev: ", st_dev, " Expectancy: ",expectancy," SQN: ",sqn);
	






   //C:/Users/edge hp/AppData/Roaming/MetaQuotes/Terminal/D0E8209F77C8CF37AD8BF550E51FF075/
   //C:\\Users\\edge hp\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\
   //C:\Users\edge hp\Desktop
   //C:\\\\Users\\edge hp\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5\\Files\\
   int file_handle=FileOpen("test\\trial5.csv",
                              FILE_READ|FILE_WRITE|FILE_CSV|FILE_COMMON,',');

   if(file_handle==-1){
      Alert("File Open Error!************************************************");
   }
   bool seek = FileSeek(file_handle, 0, SEEK_END);
   ulong bytes = FileWrite(file_handle,profit,gross_profit,gross_loss,max_profit_trade,max_loss_trade,
                           con_profit_max,con_profit_max_trades,max_con_wins,max_con_profit_trades,
                           con_loss_max,con_loss_max_trades,max_con_losses,max_con_loss_trades,
                           balance_min,balance_dd,balance_dd_percent,balance_dd_relative,balance_drel_percent,
                           equity_min,equity_dd,equity_dd_percent,equity_dd_relative,equity_drel_percent,
                           expected_payoff,profit_factor,recovery_factor,sharpe_ratio,min_margin_level,custom_on_tester,
                           deals,trades,profit_trades,loss_trades,short_trades,long_trades,profit_short_trades,profit_long_trades,
                           profit_trades_avg_con,loss_trades_avg_con,regression,sqn,
                           IntegerToString(ma_period1) + "_" + IntegerToString(ma_period2) + "_" + IntegerToString(ma_period3) + "_" + IntegerToString(ma_period4));
   Alert("bytes written: ",bytes,"********************************************************");
   FileClose(file_handle);
   Alert("File Closed*********************************************************************");
   
   return(0.0);
}


  
  
  
//+------------------------------------------------------------------+
//| Get the array of profits/losses from deals                       |
//+------------------------------------------------------------------+
bool GetTradeResultsToArray(double &pl_results[],double &volume)
  {
//--- request the complete trading history
   if(!HistorySelect(0,TimeCurrent()))
      return (false);
   uint total_deals=HistoryDealsTotal();
   volume=0;
//--- set the initial size of the array with a margin - by the number of deals in history
   ArrayResize(pl_results,total_deals);
//--- counter of deals that fix the trading result - profit or loss
   int counter=0;
   ulong ticket_history_deal=0;
//--- go through all deals
   for(uint i=0;i<total_deals;i++)
     {
      //--- select a deal 
      if((ticket_history_deal=HistoryDealGetTicket(i))>0)
        {
         ENUM_DEAL_ENTRY deal_entry  =(ENUM_DEAL_ENTRY)HistoryDealGetInteger(ticket_history_deal,DEAL_ENTRY);
         long            deal_type   =HistoryDealGetInteger(ticket_history_deal,DEAL_TYPE);
         double          deal_profit =HistoryDealGetDouble(ticket_history_deal,DEAL_PROFIT);
         double          deal_volume =HistoryDealGetDouble(ticket_history_deal,DEAL_VOLUME);
         //--- we are only interested in trading operations        
         if((deal_type!=DEAL_TYPE_BUY) && (deal_type!=DEAL_TYPE_SELL))
            continue;
         //--- only deals that fix profits/losses
         if(deal_entry!=DEAL_ENTRY_IN)
           {
            //--- write the trading result to the array and increase the counter of deals
            pl_results[counter]=deal_profit;
            volume+=deal_volume;
            counter++;
           }
        }
     }
//--- set the final size of the array
   ArrayResize(pl_results,counter);
   return (true);
  }
//+------------------------------------------------------------------+
//| Calculate the linear regression y=a*x+b                          |
//+------------------------------------------------------------------+
bool CalculateLinearRegression(double  &change[],double &chartline[],
                               double  &a_coef,double  &b_coef)
  {
//--- check for data sufficiency
   if(ArraySize(change)<3)
      return (false);
//--- create a chart array with an accumulation
   int N=ArraySize(change);
   ArrayResize(chartline,N);
   chartline[0]=change[0];
   for(int i=1;i<N;i++)
      chartline[i]=chartline[i-1]+change[i];
//--- now, calculate regression ratios
   double x=0,y=0,x2=0,xy=0;
   for(int i=0;i<N;i++)
     {
      x=x+i;
      y=y+chartline[i];
      xy=xy+i*chartline[i];
      x2=x2+i*i;
     }
   a_coef=(N*xy-x*y)/(N*x2-x*x);
   b_coef=(y-a_coef*x)/N;
//---
   return (true);
  }
//+------------------------------------------------------------------+
//|  Calculate mean-square deviation error for specified a and b     |
//+------------------------------------------------------------------+
bool  CalculateStdError(double  &data[],double  a_coef,double  b_coef,double &std_err)
  {
//--- sum of error squares
   double error=0;
   int N=ArraySize(data);
   if(N==0)
      return (false);
   for(int i=0;i<N;i++)
      error=MathPow(a_coef*i+b_coef-data[i],2);
   std_err=MathSqrt(error/(N-2));
//--- 
   return (true);
  }






