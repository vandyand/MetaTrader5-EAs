
//#include<Trade\Trade.mqh>

//CTrade trade;

input int ma_period1_1 = 2;
input int ma_period1_2 = 4;
input int ma_period1_3 = 2;
input int ma_period1_4 = 4;

input int ma_period2_1 = 2;
input int ma_period2_2 = 4;
input int ma_period2_3 = 2;
input int ma_period2_4 = 4;

input int ma_period3_1 = 2;
input int ma_period3_2 = 4;
input int ma_period3_3 = 2;
input int ma_period3_4 = 4;

input int ma_period4_1 = 2;
input int ma_period4_2 = 4;
input int ma_period4_3 = 2;
input int ma_period4_4 = 4;

input int ma_period5_1 = 2;
input int ma_period5_2 = 4;
input int ma_period5_3 = 2;
input int ma_period5_4 = 4;

input int ma_period6_1 = 2;
input int ma_period6_2 = 4;
input int ma_period6_3 = 2;
input int ma_period6_4 = 4;

input int ma_period7_1 = 2;
input int ma_period7_2 = 4;
input int ma_period7_3 = 2;
input int ma_period7_4 = 4;

input int ma_period8_1 = 2;
input int ma_period8_2 = 4;
input int ma_period8_3 = 2;
input int ma_period8_4 = 4;

input int ma_period9_1 = 2;
input int ma_period9_2 = 4;
input int ma_period9_3 = 2;
input int ma_period9_4 = 4;

input int ma_period10_1 = 2;
input int ma_period10_2 = 4;
input int ma_period10_3 = 2;
input int ma_period10_4 = 4;

input int ma_period11_1 = 2;
input int ma_period11_2 = 4;
input int ma_period11_3 = 2;
input int ma_period11_4 = 4;

input int ma_period12_1 = 2;
input int ma_period12_2 = 4;
input int ma_period12_3 = 2;
input int ma_period12_4 = 4;

input int ma_period13_1 = 2;
input int ma_period13_2 = 4;
input int ma_period13_3 = 2;
input int ma_period13_4 = 4;

input int ma_period14_1 = 2;
input int ma_period14_2 = 4;
input int ma_period14_3 = 2;
input int ma_period14_4 = 4;

input int ma_period15_1 = 2;
input int ma_period15_2 = 4;
input int ma_period15_3 = 2;
input int ma_period15_4 = 4;

input int ma_period16_1 = 2;
input int ma_period16_2 = 4;
input int ma_period16_3 = 2;
input int ma_period16_4 = 4;

input int ma_shift1_1 = 0;
input int ma_shift1_2 = 0;
input int ma_shift1_3 = 0;
input int ma_shift1_4 = 0;
input int ma_shift2_1 = 0;
input int ma_shift2_2 = 0;
input int ma_shift2_3 = 0;
input int ma_shift2_4 = 0;
input int ma_shift3_1 = 0;
input int ma_shift3_2 = 0;
input int ma_shift3_3 = 0;
input int ma_shift3_4 = 0;
input int ma_shift4_1 = 0;
input int ma_shift4_2 = 0;
input int ma_shift4_3 = 0;
input int ma_shift4_4 = 0;
input int ma_shift5_1 = 0;
input int ma_shift5_2 = 0;
input int ma_shift5_3 = 0;
input int ma_shift5_4 = 0;
input int ma_shift6_1 = 0;
input int ma_shift6_2 = 0;
input int ma_shift6_3 = 0;
input int ma_shift6_4 = 0;
input int ma_shift7_1 = 0;
input int ma_shift7_2 = 0;
input int ma_shift7_3 = 0;
input int ma_shift7_4 = 0;
input int ma_shift8_1 = 0;
input int ma_shift8_2 = 0;
input int ma_shift8_3 = 0;
input int ma_shift8_4 = 0;
input int ma_shift9_1 = 0;
input int ma_shift9_2 = 0;
input int ma_shift9_3 = 0;
input int ma_shift9_4 = 0;
input int ma_shift10_1 = 0;
input int ma_shift10_2 = 0;
input int ma_shift10_3 = 0;
input int ma_shift10_4 = 0;
input int ma_shift11_1 = 0;
input int ma_shift11_2 = 0;
input int ma_shift11_3 = 0;
input int ma_shift11_4 = 0;
input int ma_shift12_1 = 0;
input int ma_shift12_2 = 0;
input int ma_shift12_3 = 0;
input int ma_shift12_4 = 0;
input int ma_shift13_1 = 0;
input int ma_shift13_2 = 0;
input int ma_shift13_3 = 0;
input int ma_shift13_4 = 0;
input int ma_shift14_1 = 0;
input int ma_shift14_2 = 0;
input int ma_shift14_3 = 0;
input int ma_shift14_4 = 0;
input int ma_shift15_1 = 0;
input int ma_shift15_2 = 0;
input int ma_shift15_3 = 0;
input int ma_shift15_4 = 0;
input int ma_shift16_1 = 0;
input int ma_shift16_2 = 0;
input int ma_shift16_3 = 0;
input int ma_shift16_4 = 0;

input int open_bars1 = 5;
input int open_bars2 = 5;
input int open_bars3 = 5;
input int open_bars4 = 5;
input int open_bars5 = 5;
input int open_bars6 = 5;
input int open_bars7 = 5;
input int open_bars8 = 5;
input int open_bars9 = 5;
input int open_bars10 = 5;
input int open_bars11 = 5;
input int open_bars12 = 5;
input int open_bars13 = 5;
input int open_bars14 = 5;
input int open_bars15 = 5;
input int open_bars16 = 5;


input int iter = 0;
//input double drawDown = 0.9995;
//input datetime splitDate;
input string file_name = "temp";
int input MagicNumber = 200;
double input Lots = 0.01;
bool input scaleLots = false;

int slippage = 100;
int barNum = 0;
double stat_values[100]; // Array for testing parameters
bool stopTrading = false;


string symbols[16] = {"EURUSD",
                     "AUDUSD",
                     "USDJPY",
                     "GBPUSD",
                     "USDCHF",
                     "NZDUSD",
                     "USDCAD",
                     "EURJPY",
                     "EURGBP",
                     "EURAUD",
                     "AUDJPY",
                     "EURCHF",
                     "NZDJPY",
                     "CADJPY",
                     "NZDCAD",
                     "AUDCAD"};


bool longPos[16],shortPos[16],
     EnterLongSignal[16],ExitLongSignal[16], EnterShortSignal[16], ExitShortSignal[16],
     EntLRE0[16], EntLRE1[16], ExtLRE0[16], ExtLRE1[16], EntSRE0[16], EntSRE1[16], ExtSRE0[16], ExtSRE1[16]
     = {false,false,false,false,false,false,false,false,false};
int Magic[16];
int ma_period[16][4];
int ma_shift[16][4];
int open_bars[16];
int close_times[16];



int maHandle[16][4];
double mas[16][4][1];
double MA[16][4];
double price[16][4];
double rel[16][4];


int OnInit(){


   // Assign input values to arrays
   ma_period[0][0] = ma_period1_1;
   ma_period[0][1] = ma_period1_2;
   ma_period[0][2] = ma_period1_3;
   ma_period[0][3] = ma_period1_4;
   ma_shift[0][0] = ma_shift1_1;
   ma_shift[0][1] = ma_shift1_2;
   ma_shift[0][2] = ma_shift1_3;
   ma_shift[0][3] = ma_shift1_4;
   open_bars[0] = open_bars1;
   
   ma_period[1][0] = ma_period2_1;
   ma_period[1][1] = ma_period2_2;
   ma_period[1][2] = ma_period2_3;
   ma_period[1][3] = ma_period2_4;
   ma_shift[1][0] = ma_shift2_1;
   ma_shift[1][1] = ma_shift2_2;
   ma_shift[1][2] = ma_shift2_3;
   ma_shift[1][3] = ma_shift2_4;
   open_bars[1] = open_bars2;
   
   ma_period[2][0] = ma_period3_1;
   ma_period[2][1] = ma_period3_2;
   ma_period[2][2] = ma_period3_3;
   ma_period[2][3] = ma_period3_4;
   ma_shift[2][0] = ma_shift3_1;
   ma_shift[2][1] = ma_shift3_2;
   ma_shift[2][2] = ma_shift3_3;
   ma_shift[2][3] = ma_shift3_4;
   open_bars[2] = open_bars3;
   
   ma_period[3][0] = ma_period4_1;
   ma_period[3][1] = ma_period4_2;
   ma_period[3][2] = ma_period4_3;
   ma_period[3][3] = ma_period4_4;
   ma_shift[3][0] = ma_shift4_1;
   ma_shift[3][1] = ma_shift4_2;
   ma_shift[3][2] = ma_shift4_3;
   ma_shift[3][3] = ma_shift4_4;
   open_bars[3] = open_bars4;
   
   ma_period[4][0] = ma_period5_1;
   ma_period[4][1] = ma_period5_2;
   ma_period[4][2] = ma_period5_3;
   ma_period[4][3] = ma_period5_4;
   ma_shift[4][0] = ma_shift5_1;
   ma_shift[4][1] = ma_shift5_2;
   ma_shift[4][2] = ma_shift5_3;
   ma_shift[4][3] = ma_shift5_4;
   open_bars[4] = open_bars5;
   
   ma_period[5][0] = ma_period6_1;
   ma_period[5][1] = ma_period6_2;
   ma_period[5][2] = ma_period6_3;
   ma_period[5][3] = ma_period6_4;
   ma_shift[5][0] = ma_shift6_1;
   ma_shift[5][1] = ma_shift6_2;
   ma_shift[5][2] = ma_shift6_3;
   ma_shift[5][3] = ma_shift6_4;
   open_bars[5] = open_bars6;
   
   ma_period[6][0] = ma_period7_1;
   ma_period[6][1] = ma_period7_2;
   ma_period[6][2] = ma_period7_3;
   ma_period[6][3] = ma_period7_4;
   ma_shift[6][0] = ma_shift7_1;
   ma_shift[6][1] = ma_shift7_2;
   ma_shift[6][2] = ma_shift7_3;
   ma_shift[6][3] = ma_shift7_4;
   open_bars[6] = open_bars7;
   
   ma_period[7][0] = ma_period8_1;   
   ma_period[7][1] = ma_period8_2;   
   ma_period[7][2] = ma_period8_3;   
   ma_period[7][3] = ma_period8_4;
   ma_shift[7][0] = ma_shift8_1;
   ma_shift[7][1] = ma_shift8_2;
   ma_shift[7][2] = ma_shift8_3;
   ma_shift[7][3] = ma_shift8_4;
   open_bars[7] = open_bars8;
   
   ma_period[8][0] = ma_period9_1;   
   ma_period[8][1] = ma_period9_2;   
   ma_period[8][2] = ma_period9_3;   
   ma_period[8][3] = ma_period9_4; 
   ma_shift[8][0] = ma_shift9_1;
   ma_shift[8][1] = ma_shift9_2;
   ma_shift[8][2] = ma_shift9_3;
   ma_shift[8][3] = ma_shift9_4;
   open_bars[8] = open_bars9;
   
   ma_period[9][0] = ma_period10_1;
   ma_period[9][1] = ma_period10_2;
   ma_period[9][2] = ma_period10_3;
   ma_period[9][3] = ma_period10_4;
   ma_shift[9][0] = ma_shift10_1;
   ma_shift[9][1] = ma_shift10_2;
   ma_shift[9][2] = ma_shift10_3;
   ma_shift[9][3] = ma_shift10_4;
   open_bars[9] = open_bars10;

   ma_period[10][0] = ma_period11_1;
   ma_period[10][1] = ma_period11_2;
   ma_period[10][2] = ma_period11_3;
   ma_period[10][3] = ma_period11_4;
   ma_shift[10][0] = ma_shift11_1;
   ma_shift[10][1] = ma_shift11_2;
   ma_shift[10][2] = ma_shift11_3;
   ma_shift[10][3] = ma_shift11_4;
   open_bars[10] = open_bars11;
   
   ma_period[11][0] = ma_period12_1;
   ma_period[11][1] = ma_period12_2;
   ma_period[11][2] = ma_period12_3;
   ma_period[11][3] = ma_period12_4;
   ma_shift[11][0] = ma_shift12_1;
   ma_shift[11][1] = ma_shift12_2;
   ma_shift[11][2] = ma_shift12_3;
   ma_shift[11][3] = ma_shift12_4;
   open_bars[11] = open_bars12;
   
   ma_period[12][0] = ma_period13_1;
   ma_period[12][1] = ma_period13_2;
   ma_period[12][2] = ma_period13_3;
   ma_period[12][3] = ma_period13_4;
   ma_shift[12][0] = ma_shift13_1;
   ma_shift[12][1] = ma_shift13_2;
   ma_shift[12][2] = ma_shift13_3;
   ma_shift[12][3] = ma_shift13_4;
   open_bars[12] = open_bars13;
   
   ma_period[13][0] = ma_period14_1;
   ma_period[13][1] = ma_period14_2;
   ma_period[13][2] = ma_period14_3;
   ma_period[13][3] = ma_period14_4;
   ma_shift[13][0] = ma_shift14_1;
   ma_shift[13][1] = ma_shift14_2;
   ma_shift[13][2] = ma_shift14_3;
   ma_shift[13][3] = ma_shift14_4;
   open_bars[13] = open_bars14;
   
   ma_period[14][0] = ma_period15_1;
   ma_period[14][1] = ma_period15_2;
   ma_period[14][2] = ma_period15_3;
   ma_period[14][3] = ma_period15_4;
   ma_shift[14][0] = ma_shift15_1;
   ma_shift[14][1] = ma_shift15_2;
   ma_shift[14][2] = ma_shift15_3;
   ma_shift[14][3] = ma_shift15_4;
   open_bars[14] = open_bars15;
   
   ma_period[15][0] = ma_period16_1;
   ma_period[15][1] = ma_period16_2;
   ma_period[15][2] = ma_period16_3;
   ma_period[15][3] = ma_period16_4;
   ma_shift[15][0] = ma_shift16_1;
   ma_shift[15][1] = ma_shift16_2;
   ma_shift[15][2] = ma_shift16_3;
   ma_shift[15][3] = ma_shift16_4;
   open_bars[15] = open_bars16;   
   
   
   
   for(int i = 0; i < 16; i++){
      Magic[i] = MagicNumber + i;
      close_times[i] = 0;
   }
   
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 4; j++){
         maHandle[i][j] = iMA(symbols[i],_Period,ma_period[i][j],ma_shift[i][j],MODE_SMA,PRICE_OPEN);
      }
   }
   
   return(INIT_SUCCEEDED);
}

double lots = 0;

void OnTick(){
   
 

   if(Find_New_Bar()){
      barNum++;
      
      if(scaleLots){
         lots = NormalizeDouble(AccountInfoDouble(ACCOUNT_BALANCE) / 10000.0,2);
      } else {
         lots = Lots;
      }
      
      for(int i = 0; i < 16; i++){
         EntLRE1[i] = EntLRE0[i];
         ExtLRE1[i] = ExtLRE0[i];
         EntSRE1[i] = EntSRE0[i];
         ExtSRE1[i] = ExtSRE0[i];
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 4; j++){
            double holder[1];
            CopyBuffer(maHandle[i][j],0,0,1,holder);
            mas[i][j][0] = holder[0];
         }
      }
      
      for(int i = 0; i < 16; i++){
         for(int j = 0; j < 4; j++){
            MA[i][j] = mas[i][j][0];
            price[i][j] = NormalizeDouble(SymbolInfoDouble(symbols[i],SYMBOL_ASK),SymbolInfoInteger(symbols[i],SYMBOL_DIGITS));
            rel[i][j] = MA[i][j] / price[i][j];
         }
      }
      
      for(int i = 0; i < 16; i++){
         if(rel[i][0] > rel[i][1]){EntLRE0[i] = true;} else {EntLRE0[i] = false;}
         if(barNum == close_times[i]){ExtLRE0[i] = true;ExtSRE0[i] = true;} else {ExtLRE0[i] = false;ExtSRE0[i] = false;}
         if(rel[i][2] > rel[i][3]){EntSRE0[i] = true;} else {EntSRE0[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if(!EntLRE1[i] && EntLRE0[i]){EnterLongSignal[i] = true;} else {EnterLongSignal[i] = false;}
         if(!ExtLRE1[i] && ExtLRE0[i]){ExitLongSignal[i] = true;} else {ExitLongSignal[i] = false;}
         if(!EntSRE1[i] && EntSRE0[i]){EnterShortSignal[i] = true;} else {EnterShortSignal[i] = false;}
         if(!ExtSRE1[i] && ExtSRE0[i]){ExitShortSignal[i] = true;} else {ExitShortSignal[i] = false;}
      }
      
      for(int i = 0; i < 16; i++){
         if((longPos[i] && ExitLongSignal[i]) || (shortPos[i] && ExitShortSignal[i])){
            Alert("Exiting Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ----------------------------------------------------------");
            CloseRecentPosition(Magic[i]);
            //while(!CloseRecentPosition(symbols[0])){Sleep(100);}
            longPos[i] = false;
            shortPos[i] = false;
         }
      }
      
      for(int i = 0; i < 16; i++){
         if(CurrentOpenPositions(Magic[i]) < 1){
            if(EnterLongSignal[i] && !EnterShortSignal[i] && !ExitLongSignal[i]){
               Alert("Entering Long Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," *************************************************");
               if(!BuyAsync(lots,Magic[i],symbols[i])){Alert("Error entering long ",symbols[i],". Last error: ",GetLastError());}
               //while(!BuyAsync(Lots,symbols[0])){Sleep(100);}
               longPos[i] = true;
               close_times[i] = barNum + open_bars[i];
            }
            if(EnterShortSignal[i] && !EnterLongSignal[i] && !ExitShortSignal[i]){
               Alert("Entering Short Position. Currency: ",symbols[i]," MagicNumber: ",Magic[i]," ************************************************");
               if(!SellAsync(lots,Magic[i],symbols[i])){Alert("Error entering short ",symbols[i],". Last error: ",GetLastError());}
               //while(!SellAsync(Lots,symbols[0])){Sleep(100);}
               shortPos[i] = true;
               close_times[i] = barNum + open_bars[i];
            }
         }
      }
      
   }
}





double OnTester()  {
   
   double rtn = 1.0;
   
   int arg = 0;
   for(int i = 0; i < 16; i++){
      for(int j = 0; j < 4; j++){
         arg += ma_period[i][j] + ma_shift[i][j];
      }
   }
   
   double _max = 1.0;
   double _min = 0;
   double rand_scaled = ((GetMicrosecondCount()+arg)%100 / 100.0) * (_max - _min) + _min;
   
   rtn *= TesterStatistics(STAT_PROFIT) * MathAbs(TesterStatistics(STAT_SHARPE_RATIO));

   rtn *= rand_scaled;
   
   return(rtn);
}

/*
double backProfit(){
   double Res = 0;

   if(HistorySelect(0, INT_MAX)){
      for (int i = HistoryDealsTotal() - 1; i > 0; i--){
         
         ulong Ticket = HistoryDealGetTicket(i);
         datetime openTime = HistoryDealGetInteger(Ticket,DEAL_TIME);
         bool cond = openTime < splitDate;
         
         if(cond){
            Res += HistoryDealGetDouble(Ticket, DEAL_PROFIT);
         }
      }
   }
   
   return(Res);
}

double foreProfit(){
   double Res = 0;

   if(HistorySelect(0, INT_MAX)){
      for (int i = HistoryDealsTotal() - 1; i > 0; i--){
         
         ulong Ticket = HistoryDealGetTicket(i);
         datetime openTime = HistoryDealGetInteger(Ticket,DEAL_TIME);
         bool cond = openTime < splitDate2;
         
         if(cond){
            Res += HistoryDealGetDouble(Ticket, DEAL_PROFIT);
         }
      }
   }
   
   return(Res);
}
*/

bool BuyAsync(double volume, int magicNum, string symbol){
   MqlTradeRequest req={0};
   req.action      =TRADE_ACTION_DEAL;
   req.magic       =magicNum;
   req.symbol      =symbol;
   req.volume      =volume;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_ASK);
   req.deviation   =slippage;
   req.type        =ORDER_TYPE_BUY;
   req.type_filling=ORDER_FILLING_RETURN;
   req.type_time   =ORDER_TIME_GTC;
   req.comment     ="Buy using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool SellAsync(double volume, int magicNum, string symbol){
   MqlTradeRequest req={0};
   req.action      =TRADE_ACTION_DEAL;
   req.symbol      =symbol;
   req.magic       =magicNum;
   req.volume      =volume;
   req.type        =ORDER_TYPE_SELL;
   req.price       =SymbolInfoDouble(req.symbol,SYMBOL_BID);
   req.deviation   =slippage;
   req.comment     ="Sell using OrderSendAsync()";
   MqlTradeResult  res={0};
   return(OrderSendAsync(req,res));
}

bool CloseRecentPosition(int magicNum)
  {
   MqlTradeRequest req;
   MqlTradeResult  res;
   int total=PositionsTotal(); // number of open positions
   for(int i=total-1; i>=0; i--)
     {
      ulong  position_ticket=PositionGetTicket(i);                                      // ticket of the position
      string position_symbol=PositionGetString(POSITION_SYMBOL);                        // symbol 
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS);              // number of decimal places
      ulong  magic=PositionGetInteger(POSITION_MAGIC);                                  // MagicNumber of the position
      double volume=PositionGetDouble(POSITION_VOLUME);                                 // volume of the position
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);    // type of the position
      if(magic==magicNum)
        {
         ZeroMemory(req);
         ZeroMemory(res);
         req.action   =TRADE_ACTION_DEAL;        // type of trade operation
         req.position =position_ticket;          // ticket of the position
         req.symbol   =position_symbol;          // symbol 
         req.volume   =volume;                   // volume of the position
         req.deviation=slippage;                        // allowed deviation from the price
         req.magic    =MagicNumber;             // MagicNumber of the position
         if(type==POSITION_TYPE_BUY)
           {
            req.price=SymbolInfoDouble(position_symbol,SYMBOL_BID);
            req.type =ORDER_TYPE_SELL;
           }
         else
           {
            req.price=SymbolInfoDouble(position_symbol,SYMBOL_ASK);
            req.type =ORDER_TYPE_BUY;
           }
         return(OrderSendAsync(req,res));
      }
   }
   return(false);
}


int CurrentOpenPositions(int magic_number)
  {
   int count = 0;
   int total=PositionsTotal(); // number of open positions
   for(int i=total-1; i>=0; i--)
     {
      ulong  position_ticket=PositionGetTicket(i);                                      // ticket of the position
      string position_symbol=PositionGetString(POSITION_SYMBOL);                        // symbol 
      int    digits=(int)SymbolInfoInteger(position_symbol,SYMBOL_DIGITS);              // number of decimal places
      ulong  magic=PositionGetInteger(POSITION_MAGIC);                                  // MagicNumber of the position
      double volume=PositionGetDouble(POSITION_VOLUME);                                 // volume of the position
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);    // type of the position
      if(magic==magic_number)
        {
         count++;
      }
   }
   return(count);
}

// Identify new bars
bool Find_New_Bar(){
   static datetime Time[];
   int count = 1;   // number of elements to copy
   ArraySetAsSeries(Time,true);
   CopyTime(_Symbol,_Period,0,count,Time);

   static datetime New_Time = 0;
   bool New_Bar_local = false;
   if (New_Time != Time[0]){
      New_Time = Time[0];
      New_Bar_local = true;
      }
   return(New_Bar_local);
}


