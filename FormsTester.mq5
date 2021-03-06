#include<Trade\Trade.mqh>

CTrade trade;

input int ma_period1 = 0;
input int ma_period2 = 1;
input int ma_period3 = 0;
input int ma_period4 = 1;
input int openBars = 3;
input int iter = 0;

bool LogOptimizationReport  = true;           // Writing results to a file


double stat_values[12]; // Array for testing parameters


bool LongSignal = false;
bool ShortSignal = false;
bool LRE0, LRE1, SRE0, SRE1 = false;
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
   
   if(tickNum == closeTick){
      CloseAllPositions();
   }
   
   if(PositionsTotal() < 1){
      if(LongSignal && !ShortSignal){
         trade.Buy(Lots,NULL,Ask,0,0,NULL);
         closeTick = tickNum + openBars;
      }
      if(ShortSignal && !LongSignal){
         trade.Sell(Lots,NULL,Bid,0,0,NULL);
         closeTick = tickNum + openBars;
      }
   }
}

void CloseAllPositions(){
   for(int i = PositionsTotal()-1; i >= 0; i--){
      ulong ticket = PositionGetTicket(i);
      trade.PositionClose(ticket);
   }
}


int fileHandle = 0;



string name1="ma_period1";
bool enable1;
long par1,par1_start,par1_step,par1_stop;

string name2="ma_period2";
bool enable2;
long par2,par2_start,par2_step,par2_stop;

string name3="ma_period3";
bool enable3;
long par3,par3_start,par3_step,par3_stop;

string name4="ma_period4";
bool enable4;
long par4,par4_start,par4_step,par4_stop;

//+--------------------------------------------------------------------+
//| Optimization start                                                 |
//+--------------------------------------------------------------------+
void OnTesterInit()
  {
   fileHandle=FileOpen("temp.csv",FILE_READ|FILE_WRITE|FILE_CSV|FILE_COMMON,',');

  
   Print(__FUNCTION__,"(): Start Optimization \n-----------");

   ParameterGetRange(name1,enable1,par1,par1_start,par1_step,par1_stop);
   ParameterGetRange(name2,enable2,par2,par2_start,par2_step,par2_stop);
   ParameterGetRange(name3,enable3,par3,par3_start,par3_step,par3_stop);
   ParameterGetRange(name4,enable4,par4,par4_start,par4_step,par4_stop);
  }

//+--------------------------------------------------------------------+
//| Test completion event handler                                      |
//+--------------------------------------------------------------------+
double OnTester()
  {
//--- If writing of optimization results is enabled
   if(LogOptimizationReport)
     {
      //--- Fill the array with test values
      GetTestStatistics(stat_values);
      //--- Create a frame
      FrameAdd("Statistics",1,0,stat_values);
     }
//---
   return(0.0);
  }

//+--------------------------------------------------------------------+
//| Next optimization pass                                             |
//+--------------------------------------------------------------------+
void OnTesterPass(){
   

//--- If writing of optimization results is enabled
   if(LogOptimizationReport){
      string name ="";  // Public name/frame label
      ulong  pass =0;   // Number of the optimization pass at which the frame is added
      long   id   =0;   // Public id of the frame
      double val  =0.0; // Single numerical value of the frame
      //---
      
      while(FrameNext(pass,name,id,val,stat_values)){
      //---
      //Print(__FUNCTION__,"(): pass: "+IntegerToString(pass)+"; STAT_PROFIT: ",DoubleToString(stat_values[0],2));
      
      ulong bytes = FileWrite(fileHandle,DoubleToString(stat_values[0],2),DoubleToString(stat_values[1],2),
         DoubleToString(stat_values[2],2),DoubleToString(stat_values[3],2),
         DoubleToString(stat_values[4],2),DoubleToString(stat_values[5],2),
         DoubleToString(stat_values[6],2),DoubleToString(stat_values[7],2),
         DoubleToString(stat_values[8],2),DoubleToString(stat_values[9],2),
         DoubleToString(stat_values[10],2),DoubleToString(stat_values[11],2));
      }
   }
}
//+--------------------------------------------------------------------+
//| End of optimization                                                |
//+--------------------------------------------------------------------+
void OnTesterDeinit()
  {
   Print("-----------\n",__FUNCTION__,"(): End Optimization");
//--- If writing of optimization results is enabled
   if(LogOptimizationReport){}
      //---
   FileClose(fileHandle);
  }


//+--------------------------------------------------------------------+
//| Filling the array with test results                                |
//+--------------------------------------------------------------------+
void GetTestStatistics(double &stat_array[])
  {
//--- Auxiliary variables for value adjustment
   double profit_factor=0,sharpe_ratio=0;
//---
   stat_array[0]=TesterStatistics(STAT_PROFIT);                // Net profit upon completion of testing
   stat_array[1]=TesterStatistics(STAT_TRADES);                // Number of executed trades
//---
   profit_factor=TesterStatistics(STAT_PROFIT_FACTOR);         // Profit factor – the STAT_GROSS_PROFIT/STAT_GROSS_LOSS ratio 
   stat_array[2]=(profit_factor==DBL_MAX) ? 0 : profit_factor; // adjust if necessary
//---
   stat_array[3]=TesterStatistics(STAT_EXPECTED_PAYOFF);       // Expected payoff
   stat_array[4]=TesterStatistics(STAT_EQUITY_DDREL_PERCENT);  // Max. equity drawdown, %
   stat_array[5]=TesterStatistics(STAT_RECOVERY_FACTOR);       // Recovery factor – the STAT_PROFIT/STAT_BALANCE_DD ratio
//---
   sharpe_ratio=TesterStatistics(STAT_SHARPE_RATIO);           // Sharpe ratio - investment portfolio (asset) efficiency index
   stat_array[6]=(sharpe_ratio==DBL_MAX) ? 0 : sharpe_ratio;   // adjust if necessary
   
   stat_array[7]=iter;
   stat_array[8]=ma_period1;
   stat_array[9]=ma_period2;
   stat_array[10]=ma_period3;
   stat_array[11]=ma_period4;
   
   //IntegerToString(init)+"_"+IntegerToString(ma_period1)+"_"+IntegerToString(ma_period2)+"_"+IntegerToString(ma_period3)+"_"+IntegerToString(ma_period4);
   
  }







