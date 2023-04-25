//+------------------------------------------------------------------+
//|                                             Yevheniy             |
//|                                             Nucleo   v 1.9.1.mq4 |
//|                                                                  |
//+------------------------------------------------------------------+


#property copyright "Yevheniy Kopanitskyy"
#property link      "https://www.mql5.com/en/users/eugeniokp"
#property version   "1.9"
#property strict


//-----EXTERNAL VAR-----
extern bool LongPosition=false;//Long
extern bool ShortPosition=false;//Short
extern bool BinIndWRITE=false;
extern bool ALLtoARRAYWRITE=false;
extern bool BODYHorizont=false;

//--END---EXTERNAL VAR-----

//------Importing TELEGRAM library - Sending messages to a channel------------------------------
//#import "Telegram4Mql.dll"
//string TelegramSendTextAsync(string apiKey,string chatId,string chatText);
//string TelegramSendText(string apiKey,string chatId,string chatText);
//string TelegramSendScreenAsync(string apiKey,string chatId,string caption="");
//string TelegramSendScreen(string apiKey,string chatId,string caption="");
//string TelegramGetUpdates(string apiKey,string validUsers,bool confirmUpdates);
//string TelegramSendPhoto(string apiKey,string chatId,string filePath,string caption="");
//string TelegramSendPhotoAsync(string apiKey,string chatId,string filePath, string caption = "");
//string TelegramSendDocument(string apiKey, string chatId, string filePath, string caption = "");
//string TelegramSendDocumentAsync(string apiKey,string chatId,string filePath,string caption="");
//...
//#import
//---END---Importing TELEGRAM library - Sending messages to a channel------------------------------


//------ARRAYS-----
double body[99999,20];//m
//double BinaryKeys[9999,2000];
int MaxMinArr[99999];//m
double kompa[10000];
double kompa1[10000];
datetime PIPS_COL_DT[99999];
double  PIPS_COL_Price[99999,6];
int bbb[1681,3];
int bbb_compare[9999,2,1681];
int errorprint[50];
int errorprint2[150];
//int priceBEBO[100000,2];
double AllAnalisysData[7205,20];
datetime DT_AllAnalisysData[7205,1];
double BodyHorizont_Bin[7210,2000];
double BodyHorizont_Price[7210,2000];
datetime BodyHorizont_Time[7210];
double bodyAR[90000,50];
datetime bodydt[90000];
double body_Plus[99999,20];//Массив для перезаписи
double komp1[99999];// Array for displaying the synapse in the record
int ArrayMaximum_0[10000];//999999
int ArrayMaximum_1[10000];//999999
//int bintoarr[1441,1001];//запись параметров бинарного кода в массив.Запись массива раз в сутки в бинарный фаил
//int IFb1;//Индекс 1 для массива bintoarr
//int IFb2;//Индекс 2 для массива bintoarr
//int BinaryToArray[32000,1001];//месяц записи в массив бинарного кода. Записись нужно производить другим скриптом
//datetime bintoarrTIME [1441];//Массив для записи времени свечи
//datetime BinaryToArrayTIME[32000];//Массив для обьеденения времени свечи
//double bintoarrBID[1441,1001];//Массив для записи бид цены по тику
//double BinaryToArrayBID[32000,1001];//Массив для записи  бид
//int temparrbin[1441,1001];//Массив для записи отсеенных данных бинарного кода
//double temparrbid[1441,1001];
//datetime temparrtime[1441];
//datetime binrepit[32000,1001];//Запись повторов бинарных свечей
double bodypips[99999,5];// Array for data analysis using the Sunflower method
double comp_bodypips[99999];
//---END---ARRAYS----
//------DOUBLE VARS-----
double normalLevel;
double center;
double DoublspredPoint;
double LEVELUP;
double LEVELDOWN;
double PriceZero;
double CopenRes;
double CcloseRes;
double Level;
double LEVELK=1;
double Onda1;
double CurPips;
double price_Menus_one,pips_Menus_one;
double restanteminimum;
double restantemaximum;
double Str_Pr_Bar=0;
double Price1;
double Price0;
double price_minus;
double price_plus;
double BoolInd;//Bool
double BearInd;
double Maximum;//bool
double Minimum;
double PipsDif;
double IpaintFiboLineUP_2;
double IpaintFiboLineUP_3;
double IpaintFiboLineUP_5;
double IpaintFiboLineUP_8;
double IpaintFiboLineUP_13;
double IpaintFiboLineUP_21;
double IpaintFiboLineUP_34;
double IpaintFiboLineUP_55;
double IpaintFiboLineUP_89;
double IpaintFiboLineUP_144;
double IpaintFiboLineDOWN_2;
double IpaintFiboLineDOWN_3;
double IpaintFiboLineDOWN_5;
double IpaintFiboLineDOWN_8;
double IpaintFiboLineDOWN_13;
double IpaintFiboLineDOWN_21;
double IpaintFiboLineDOWN_34;
double IpaintFiboLineDOWN_55;
double IpaintFiboLineDOWN_89;
double IpaintFiboLineDOWN_144;
double HIGHT;
double LOW;
double CLOSE;
double OPEN;
double resOperandMax;
double resOperandMin;
//--END----DOUBLE VARS-----
int Gx,Gy;
int fgf;
int fgi;
int fgo;
int k;
int printdesc1;
int printdesc2;
int printdesc3;
int printdesc4;
int printdesc5, permis;
int LongShort;
int Counter1;
int Counter1_1;
int Counter0;
int Counter0_1;
int Counter_Summa1;
int Counter_Summa0;
int zeroindex;
int Counter=0;
int TotaltuADDtoSELLTEXT,TotaltuADDtoBUYTEXT;
int file_handle4;
int iarw,BinInd3,BinInd3BO,BinInd3BE;
int  spredpoints=15;
int Handle;
int MaxBinNumber_1Index;
int MaxBinNumber_0Index;
int MaxBinNumber_1;
int MaxBinNumber_0;
int mult=100000;
int IndexMaximum;
int IndexMinimum;
int MaxInd_bodypips;
int Switch1;
int iaq,ibq;
int ONE_BE;
int IreceiveLevelresult;
int NormalizaDigi=5;
int im;
int Bear_Z,Bool_Z;
int Switch_L_S;
int Rez_BE,one_BE;
//---END---INTEGER VARS-----
//---Переменные индикатора Маховик Времени
//Часы 1
// Массивы для пересчётов
int Sev[9,9];
int Var1_Be_0;
int Var1_Bo_0;
int Var1_Be_1;
int Var1_Bo_1;
int Var2_Be_0;
int Var2_Bo_0;
int Var2_Be_1;
int Var2_Bo_1;
// Переменные для разрешений
int sev;
int yug;
int zap;
int vost;
// Переменные для лица и изнанки
int lic;
int izn;
//Подача данных из подсолнуха

int Be_0=0;
int Bo_0=0;
int Be_1=0;
int Bo_1=0;
int Be_0_Asign=0;
int Bo_0_Asign=0;
int Be_1_Asign=0;
int Bo_1_Asign=0;
int CheFe=0;
//Часы 2
// Массивы для пересчётов для Z Оси
int z_Sev[9,9];
int z_Var1_Be_0;
int z_Var1_Bo_0;
int z_Var1_Be_1;
int z_Var1_Bo_1;
int z_Var2_Be_0;
int z_Var2_Bo_0;
int z_Var2_Be_1;
int z_Var2_Bo_1;
// Переменные для разрешений
int z_sev;
int z_yug;
int z_zap;
int z_vost;
// Переменные для лица и изнанки
int z_lic;
int z_izn;
//Подача данных из подсолнуха

int z_Be_0;
int z_Bo_0;
int z_Be_1;
int z_Bo_1;
int z_Be_0_Asign;
int z_Bo_0_Asign;
int z_Be_1_Asign;
int z_Bo_1_Asign;
int z_CheFe=0;
int z_Sev_1;
int z_Yug_1;
int z_Vost_1;
int z_Zap_1;
string z_BlockNum="0";
int z_errorprint[150];
int z_errorprint2[150];
int z_Gx,z_Gy;

extern bool Compens=true;
extern bool GAP=false;
// Подача разрешений для сторон света
int Sev_1;
int Yug_1;
int Vost_1;
int Zap_1;
// Разметка 4 переменных по 4 сторонам света с лицом и изнанкой и привязкой к Северной стороне как исходной позиции
//Север
//   Sev[1,1]=0; Be_0
//   Sev[1,2]=0; Bo_0
//   Sev[1,3]=0; Be_1
//   Sev[1,4]=0; Bo_1
// Изнанка
//   Sev[1,5]=1; Bo_0
//   Sev[1,6]=1; Be_0
//   Sev[1,7]=1; Bo_1
//   Sev[1,8]=1; Be_1

//Юг
//   Sev[1,1]=0; Be_1
//   Sev[1,2]=0; Bo_1
//   Sev[1,3]=0; Be_0
//   Sev[1,4]=0; Bo_0
// Изнанка
//   Sev[1,5]=1; Bo_1
//   Sev[1,6]=1; Be_1
//   Sev[1,7]=1; Bo_0
//   Sev[1,8]=1; Be_0

//Запад
//   Sev[1,1]=0; Bo_0
//   Sev[1,2]=0; Be_1
//   Sev[1,3]=0; Bo_1
//   Sev[1,4]=0; Be_0
// Изнанка
//   Sev[1,5]=1; Be_1
//   Sev[1,6]=1; Bo_0
//   Sev[1,7]=1; Be_0
//   Sev[1,8]=1; Bo_1

//Восток
//   Sev[1,1]=0; Bo_1
//   Sev[1,2]=0; Be_0
//   Sev[1,3]=0; Bo_0
//   Sev[1,4]=0; Be_1
// Изнанка
//   Sev[1,5]=1; Be_0
//   Sev[1,6]=1; Bo_1
//   Sev[1,7]=1; Be_1
//   Sev[1,8]=1; Bo_0

//---
//------STRING VARS-----
string File_Name="File.csv";
string FR_Nm=".csv";
string filename;
string Sw_On;
string copy="copy";
string SYmbol=Symbol();
string RectanglLabel;
string TextVisualIndicator;
string Bo,Be;
string Obiekt101="Obiekt101";
string Obiektcampo1="100",Obiektcampo2="101",Obiektcampo3="102",Obiektcampo4="103",Obiektcampo5="104",Obiektcampo6="105",Obiektcampo7="106",Obiektcampo8="107",Obiektcampo9="108",Obiektcampo10="109",Obiektcampo11="110",Obiektcampo12="111",Obiektcampo13="112",Obiektcampo14="113",Obiektcampo15="114";
//---END---STRING VARS-----
//-----FILE NAMES-----
//string FileName1=SYmbol+" MEMORYnature.txt";
//string FileName3=SYmbol+" MEMORYnature_FTP.txt";
//string FileName2=SYmbol+" MEMORYnature-ALLSIGNALS.txt";
string FileName4=SYmbol+"1.8Long&Short-Signals.txt";
//string FileName5=SYmbol+" LEVELS PRICE.txt";
string FileName6=SYmbol+"1.8indexarray.bin";
string FileName7=SYmbol+"1.8alltoarray.bin";
//string FileName8=SYmbol+" BinaryKeys_BIN.bin";
//string FileName9=SYmbol+" BinaryKeys_BID.bin";
//string FileName10=SYmbol+" BinaryKeys_TIME.bin";
string FileName12="1.8bbb.bin";
//string FileName11=SYmbol+" BinaryKeys-Repit_TIME.bin";//массив в котором хранятся повторы ключей по времени, если повтор был то фиксируется время открытия свечи
string FileName13="1.8bbb_compare.bin";
string FileName14=SYmbol+"1.8PIPS_COLLECTION.txt";
string FileName15=SYmbol+"1.8PIPS_COL_DT.bin";
string FileName16=SYmbol+"1.8PIPS_COL_Price.bin";
string FileName17=SYmbol+"1.8DataCompare.txt";
//string FileName18=SYmbol+" priceBEBO.bin";//Фаил отгрузки и загрузки
string FileName19=SYmbol+"1.8AllAnalisysData.bin";//m
string FileName20=SYmbol+"1.8DT_AllAnalisysData.bin";
string FileName21=SYmbol+"1.8BodyHorizont_Bin.bin";
string FileName22=SYmbol+"1.8BodyHorizont_Price.bin";
string FileName23=SYmbol+"1.8BodyHorizont_Time.bin";

//string apikey="630515987:AAHk0ChIBaW3aOZBP1mFQBSK-4HXsBvbB6I";
//string chatid="-1001177290832";//654751710 bot chat
//--END---FILE NAMES-----
//------DATETIME VARS-----
datetime time_bar,time_BR,Bar_Tm=0;
datetime BrTime;
datetime bartimeresult;
//---END---DATETIME VARS-----

//------BOOL VARS-----
bool write=true;
bool writeall=true;
bool write_Zero=true;
//---END---BOOL VARS-----
//------LONG VARS-----
long CHWPX;
//---END---LONG VARS-----
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
// --- REVISIONS --- //
//---1.7.1
// --- Added enabling and disabling writing to arrays ALLtoARRAYWRITE
// --- Added enabling and disabling recording to BODYHorizont arrays
// --- Added changing the ONE_be variable to int in the cycle of transferring messages to telegrams and writing data to a file


// --- initialization of arrays-----
   ArrayInitialize(body,10);
   ArrayInitialize(bodypips,0);
   ArrayInitialize(comp_bodypips,0);
   ArrayInitialize(PIPS_COL_DT,0);
   ArrayInitialize(PIPS_COL_Price,0);
// ArrayInitialize(priceBEBO,2);//Массив инициализирую числом
   ArrayInitialize(AllAnalisysData,1000);//Массив инициализирую числом
   ArrayInitialize(BodyHorizont_Bin,10);
   ArrayInitialize(BodyHorizont_Price,10);
   ArrayInitialize(bodyAR,61);

// ---END---initialization of arrays-----

// --- Initialization of the Telegram Bot

//TelegramSendText(apikey,chatid,"Tatiana_Bot_Initialized_V_1.7");
// ---END---Initialization of the Telegram Bot
//--Индикатор бинарный код - цель получение повторений индикатора
   Price1=0;
   Price0=0;
// присваивание значения индексам для массива
// IFb1=0;//номер строки
// IFb2=0;// ячейка в строке
// ArrayInitialize(bintoarr,10);//Инициализирую массив при запуске советника
// ArrayInitialize(BinaryToArray,10);//Инициализирую массив при запуске советника
// ArrayInitialize(temparrbin,10);
// ArrayInitialize(temparrbid,10);
// ArrayInitialize(temparrtime,10);
// ArrayInitialize(bintoarrBID,10);
// ArrayInitialize(BinaryToArrayBID,10);
// ArrayInitialize(binrepit,10);


//--Autentification
// if(AccountNumber()!=29856891)
//   {
//    Alert(" Autentificacion Faild ");
//   }
// return(0);
//--END --- Autentification

// - Working with charts ---

   ChartSetInteger(0,CHART_SHOW_GRID,0,false);
   ChartSetInteger(0,CHART_DRAG_TRADE_LEVELS,0,false);
   ChartSetInteger(0,CHART_SHIFT,0,true);
   ChartSetDouble(0,CHART_SHIFT_SIZE,25);
   ChartSetSymbolPeriod(0,Symbol(),PERIOD_M1);
   ChartSetInteger(0,CHART_MODE,CHART_CANDLES);
   ChartSetInteger(0,CHART_COLOR_BACKGROUND,clrWhite);
   ChartSetInteger(0,CHART_COLOR_FOREGROUND,clrBlack);
   ChartSetInteger(0,CHART_COLOR_CHART_UP,clrBlack);
   ChartSetInteger(0,CHART_COLOR_CHART_DOWN,clrBlack);
   ChartSetInteger(0,CHART_COLOR_CHART_LINE,clrBlack);
   ChartSetInteger(0,CHART_COLOR_CANDLE_BULL,clrWhite);
   ChartSetInteger(0,CHART_COLOR_CANDLE_BEAR,clrBlack);
   ChartSetInteger(0,CHART_COLOR_BID,clrGreen);

//---END--- Working with charts ---
   printdesc1=1;
   printdesc2=0;
   printdesc3=0;
   printdesc4=0;
   printdesc5=0;
// ----- rectangular window object-----
   CHWPX=-1;
   ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0,CHWPX);
// ---END -- rectangular window object-----

//----General Variables------
   BrTime=iTime(Symbol(),0,1);
   HIGHT=iHigh(Symbol(),0,1);
   im=0;
//--END--General Variables------

//-----------------------Loading Files bbb.bin i bbb_compare.bin into an array---------------------------//
   int file_handle12=FileOpen(FileName12,FILE_READ|FILE_WRITE|FILE_BIN);//Loading bbb.bin
   Print("HANDLE bbb.bin ",file_handle12);
   if(file_handle12>0)
     {

      FileSeek(file_handle12,0,SEEK_CUR);

      uint test=FileReadArray(file_handle12,bbb,0,WHOLE_ARRAY);
      Print("READ bbb.bin ",test);
      FileClose(file_handle12);
     }
//-----------------------------------------------------------------------------------
   int file_handle13=FileOpen(FileName13,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   Print("HANDLE bbb_compare ",file_handle13);
   if(file_handle13>0)
     {

      FileSeek(file_handle13,0,SEEK_CUR);

      uint test=FileReadArray(file_handle13,bbb_compare,0,WHOLE_ARRAY);
      Print("READ bbb_compare ",test);
      FileClose(file_handle13);
     }
//-----------------------------------------------------------------------------------

// int file_handle15=FileOpen(FileName15,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
// Print("PIPS_COL_DT ",file_handle15);
// if(file_handle15>0)
// {

//FileSeek(file_handle15,0,SEEK_CUR);

// uint test=FileReadArray(file_handle15,PIPS_COL_DT,0,WHOLE_ARRAY);
// Print("READ PIPS_COL_DT ",test);
// FileClose(file_handle15);
// }
//-----------------------------------------------------------------------------------

//int file_handle16=FileOpen(FileName16,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
// Print("PIPS_COL_Price ",file_handle16);
// if(file_handle16>0)
//  {

//  FileSeek(file_handle16,0,SEEK_CUR);

//   uint test=FileReadArray(file_handle16,PIPS_COL_Price,0,WHOLE_ARRAY);
//  Print("READ PIPS_COL_Price ",test);
// FileClose(file_handle16);
// }
//-------Loading previously collected and filtered data-----------------------------

   int file_handle17=FileOpen(FileName21,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   if(file_handle17>0)
     {

      FileSeek(file_handle17,0,SEEK_CUR);

      uint test=FileReadArray(file_handle17,BodyHorizont_Bin,0,WHOLE_ARRAY);
      FileClose(file_handle17);
     }
//-----------------------------------------------------------------------------------

   int file_handle18=FileOpen(FileName22,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   if(file_handle18>0)
     {

      FileSeek(file_handle18,0,SEEK_CUR);

      uint test=FileReadArray(file_handle18,BodyHorizont_Price,0,WHOLE_ARRAY);
      FileClose(file_handle18);
     }
//-----------------------------------------------------------------------------------

   int file_handle19=FileOpen(FileName23,FILE_READ|FILE_WRITE|FILE_BIN);//m
   if(file_handle19>0)
     {

      FileSeek(file_handle19,0,SEEK_CUR);

      uint test=FileReadArray(file_handle19,BodyHorizont_Time,0,WHOLE_ARRAY);
      FileClose(file_handle19);
     }
//-----END Loading previously collected and filtered data----------------------------

// ----- The function that reflects the "circle" symbol on the chart when loading the algorithm into memory--
   time_BR=Time[0];
   if(time_BR!=0)
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrGreen);
   else
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrRed);

// -----END --- The function that reflects the "circle" symbol on the chart when loading the algorithm into memory--
   return(0);


  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
int start()
  {


   if(time_bar!=Time[0])// Body area containing binary code analyzers
     {

      //----
      time_bar=Time[0];

      // ---- unwrap writing the body array and writing data to the week array
      // --- I write to 3 arrays using the index. Array 1 Binary sequence Array 2 price corresponding to the binary sequence 3 candle open time
      // --- It is necessary to combine the array data with a separate script
      // --- arrays are 7210 lines in size and 10000 width


      int inx;
      for(inx=1; inx<7210; inx++)
        {
         if(BodyHorizont_Bin[inx,1]==10)//индекс заполняемой строки в массиве
           {
            break;
           }
        }
      // rewrite from vertical to horizontal
      // Assigning candle time values ​​to an array
      BodyHorizont_Time[inx]=iTime(Symbol(),0,1);

      int inx_1;
      for(inx_1=1; inx_1<99999; inx_1++)
        {
         //Print("Body Init ",body[inx_1,0]);//Ошибок НЕТ
         if(body[inx_1,0]==10)// line number where writing to the array ended
           {
            break;
           }
        }
      // Add the use of Hep overshoot to the top or bottom
      // For gaps, use calculations that determine the number of pips.
      // Correction of the first value from the previous record.
      // You need to select the value of the last item in the array
      // Assign the binary code values ​​to the BodyHorizont_Bin and BodyHorizont_Price array and compare with the first price and bincode value in the Body array
      // If the price is the same as in the body, then the new record is assigned the value of the last record of the body array. Horizon example Body 1 1.13200 and body horizon 1 1.13200
      // If the price is the same as in the body, then the new record is assigned the value of the last record of the body array. Horizon example Body 1 1.13200 and body horizon 0 1.13200 then change the value to 0
      // if the price in the body has decreased from the price of the bodyhorizon, then set 0; if it has risen, then set 1
      // define the end of the previous record in the BodyHorizont_Bin array through the pho loop
      if(GAP==true)
        {
         int fg;
         int swi=0;
         if(inx>1)// the first record in the array is skipped
           {
            for(fg=1; fg<2000; fg++)
              {
               //Print("fg ",fg);
               if(BodyHorizont_Bin[inx-1,fg]==10)
                 {
                  break;
                 }
              }
            // ----- Defining a gap when opening a new bar-----

            if(inx>1 && body[1,0]<3)// the first record in the array is skipped
              {
               if(BodyHorizont_Price[inx-1,fg-1]!=body[1,0])
                 {
                  if(BodyHorizont_Price[inx-1,fg-1]>body[1,0])// The closing price is higher than the opening price, which means the price has dropped
                    {
                     PipsDif=NormalizeDouble(((NormalizeDouble(BodyHorizont_Price[inx-1,fg-1],5)-NormalizeDouble(body[1,0],5))*100000),0);// Get the number of pips of the price difference
                     //Print(" PipsDIf 1 ",PipsDif);
                     swi=1;
                    }
                  if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])// The closing price is higher than the opening price, which means the price has dropped
                    {
                     PipsDif=NormalizeDouble(((NormalizeDouble(body[1,0],5)- NormalizeDouble(BodyHorizont_Price[inx-1,fg-1],5))*100000),0);// Get the number of pips of the price difference
                     //Print(" PipsDIf 2 ",PipsDif," body[1,0] ",body[1,0]," BodyHorizont_Price[inx-1,fg-1] ",BodyHorizont_Price[inx-1,fg-1]);
                     swi=2;
                    }
                 }
              }

            if(inx>1 && body[1,3]<3)// the first record in the array is skipped
              {
               if(BodyHorizont_Price[inx-1,fg-1]!=body[1,3])
                 {
                  if(BodyHorizont_Price[inx-1,fg-1]>body[1,3])// The closing price is higher than the opening price, which means the price has dropped
                    {
                     PipsDif=NormalizeDouble(((NormalizeDouble(BodyHorizont_Price[inx-1,fg-1],5)-NormalizeDouble(body[1,3],5))*100000),0);// Get the number of pips of the price difference
                     //Print(" PipsDIf 3 ",PipsDif);
                     swi=1;
                    }
                  if(BodyHorizont_Price[inx-1,fg-1]<body[1,3])// The closing price is higher than the opening price, which means the price has dropped
                    {
                     PipsDif=NormalizeDouble(((NormalizeDouble(body[1,3],5)-NormalizeDouble(BodyHorizont_Price[inx-1,fg-1],5))*100000),0);// Get the number of pips of the price difference
                     //Print(" PipsDIf 4 ",PipsDif);
                     swi=2;
                    }
                 }
              }
            // ----- I overwrite arrays to add values -----

            // -----I transfer the values ​​of the body array to the body plus

            if(inx>1)// the first record in the array is skipped
              {
               for(fgf=1; fgf<99999; fgf++)
                 {
                  //Print("fg ",fg);
                  if(body[fgf,0]==10)
                    {
                     break;
                    }
                 }
              }
            // ----- I overwrite arrays -----------------
            for(fgo=0; fgo<4; fgo++)
              {
               for(fgi=1; fgi<fgf; fgi++)
                 {
                  //Print("Line 613 ",body[fgi,fgo]);//ассмотреть масив по столбцам раздельно
                  body_Plus[fgi,fgo]=body[fgi,fgo];

                 }
              }

            // ----- Fill the array with GEP values-----

            if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])// If the price is the same in the arrays and the binary code is the same, then I skip the action
              {
               if(body[1,0]<3)
                 {
                  ArrayInitialize(body,10);
                  if(swi==2)
                    {
                     for(int fgw=0; fgw<PipsDif+1; fgw++)
                       {

                        body[fgw,0]=BodyHorizont_Price[inx-1,fg-1]+0.00001;// Assign price values
                        body[fgw,1]=1;// Assign binary code values
                        Print("Body Init 2 ",body[fgw,0]);
                       }
                    }
                 }
              }


            // Comparison of 2 arrays, I correct the writing of the binary code in the BODY array
            if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])// If the price is the same in the arrays and the binary code is the same, then I skip the action
              {
               body[1,1]=1;// If the price in BODY is more than in BodyHorizont then I assign 1
              }
            if(BodyHorizont_Price[inx-1,fg-1]>body[1,0])// If the price is the same in the arrays and the binary code is the same, then I skip the action
              {
               body[1,1]=0;// If the price in BODY is less than in BodyHorizont then I assign 0
              }
            if(BodyHorizont_Price[inx-1,fg-1]==body[1,0] && BodyHorizont_Bin[inx-1,fg-1]!=body[1,1])// If the price is the same in the arrays and the binary code is the same, then I skip the action
              {
               body[1,1]=BodyHorizont_Bin[inx-1,fg-1];// If the price in the body is more than in the bodyhorizont, then I assign 1
              }
           }



         int inx_2;
         for(inx_2=1; inx_2<inx_1; inx_2++)
           {
            //Print(" Line 659 ",body[inx_2,0]);
            BodyHorizont_Bin[inx,inx_2]=body[inx_2,1];
           }
         // Assigning price values ​​to an array
         for(inx_2=1; inx_2<inx_1; inx_2++)
           {

            if(body[inx_2,0]<2 && body[inx_2,0]!=3)// Assign a value if the value in the 0 column is less than 0
              {
               BodyHorizont_Price[inx,inx_2]=body[inx_2,0];
              }
            if(body[inx_2,0]==3)// Assign a value if the 0 column has a value of 3
              {
               BodyHorizont_Price[inx,inx_2]=body[inx_2,3];
              }

           }


         if(BODYHorizont==true)
           {
            // Writing arrays to a binary file
            // --- ADD CHANGE FILE NAME TO x_FILE NAME
            //------Writing the received data to a files-----------

            int file_handle21=FileOpen(FileName21,FILE_READ|FILE_WRITE|FILE_BIN);
            if(file_handle21>0)
              {

               FileSeek(file_handle21,0,SEEK_CUR);

               uint test=FileWriteArray(file_handle21,BodyHorizont_Bin,0,WHOLE_ARRAY);
               FileClose(file_handle21);
              }
            //-----------------------------------------------------------------------------------

            int file_handle22=FileOpen(FileName22,FILE_READ|FILE_WRITE|FILE_BIN);
            if(file_handle22>0)
              {

               FileSeek(file_handle22,0,SEEK_CUR);

               uint test=FileWriteArray(file_handle22,BodyHorizont_Price,0,WHOLE_ARRAY);
               FileClose(file_handle22);
              }
            //-----------------------------------------------------------------------------------

            int file_handle23=FileOpen(FileName23,FILE_READ|FILE_WRITE|FILE_BIN);
            if(file_handle23>0)
              {

               FileSeek(file_handle23,0,SEEK_CUR);

               uint test=FileWriteArray(file_handle23,BodyHorizont_Time,0,WHOLE_ARRAY);
               FileClose(file_handle23);
              }
           }
        }//END GAP

      //------Loading data from an array-----------
      // ----- testing process
      //-----Индексы
      //Print("Индекс записи inx ",inx);
      //Print("Глубина Боди inx_1 ",inx_1);
      //Print("Колличество заполненных элементов inx_2 ",inx_2);
      //-----Проверка записи
      //for(int ghj=1; ghj<2000; ghj++)
      // {
      // if(BodyHorizont_Price[inx,ghj]==10)
      //{
      //   Print(" Конец заполненой строки ",ghj);
      //  break;
      // }
      // }
      // Print("Цена начало боди ",body[1,0]);
      // Print("Цена конец боди ",body[inx_1-1,0]);
      // Print("Бинкод начало боди ",body[inx_1,1]);
      // Print("Бинкод Конец боди ",body[inx_1-1,1]);


      //Print("Бинкод начало массива ",BodyHorizont_Bin[inx,1]);
      //Print("Бинкод Конец массива ",BodyHorizont_Bin[inx,inx_1-1]);
      //Print("Цена начало массива ",BodyHorizont_Price[inx,1]);
      //Print("Цена конец массива ",BodyHorizont_Price[inx,inx_1-1]);

      //Print("Цена начало массива -контроль ",BodyHorizont_Price[inx,0]);
      //Print("Цена конец массива - контроль ",BodyHorizont_Price[inx,inx_1]);
      //Print("Бинкод начало массива -контроль ",BodyHorizont_Bin[inx,0]);
      //Print("Бинкод конец массива - контроль ",BodyHorizont_Bin[inx,inx_1]);
      //Print("Время  - контроль ",BodyHorizont_Time[inx]);
      //----------------------------------------------------------
      //for(int mn=1; mn<inx_1; mn++)
      //  {
      //   Print("Цена весь Массив ",BodyHorizont_Price[inx,mn]);
      //  }

      // for(int mn=1; mn<inx_1; mn++)
      // {
      //  Print("Бинкод Весь Массив ",BodyHorizont_Bin[inx,mn]);
      // }

      if(BinIndWRITE==true)
        {

         // ----- BigPipsFinder indicator ------
         price_Menus_one=bodypips[MaxInd_bodypips,0];
         pips_Menus_one=bodypips[MaxInd_bodypips,1];
         //Print("Price init 1  - ",bodypips[MaxInd_bodypips,0]);
         ArrayInitialize(bodypips,0);
         ArrayInitialize(comp_bodypips,0);
         for(int imm=1; imm<99999; imm++)
           {
            //Print("body[imm,0] ",body[imm,0]);
            if(body[imm,0]==10)
              {
               break;
              }

           }
         if(body[1,0]>0 && body[1,0]<3)
           {
            if(body[1,1]==1)// If there is 1 in a binary cell, then indicate the price above + 0.00001
              {
               // Indicate the price
               double price=body[1,0]+0.00001;// Get the price of the pointer
               bodypips[1,0]=price;// Assign the price to the first box of the array. The array is filled with 0;
               bodypips[1,1]=bodypips[1,1]+1;// Increase the value of the array + 1;
              }
            if(body[1,1]==0)// If in binary cell 1, then indicate the price higher - 0.00001
              {
               // Indicate the price
               double price=body[1,0]-0.00001;//Get the price of the pointer
               bodypips[1,0]=price;// Assign the price to the first box of the array. The array is filled with 0;
               bodypips[1,1]=bodypips[1,1]+1;// Increase the value of the array + 1;
              }

           }

         if(body[1,3]>0 && body[1,3]<3)
           {
            if(body[1,1]==1)// If there is 1 in a binary cell, then indicate the price above + 0.00001
              {
               // Indicate the price
               double price=body[1,3]+0.00001;//Получаю цену указателя
               bodypips[1,0]=price;// Assign the price to the first box of the array. The array is filled with 0;
               bodypips[1,1]=bodypips[1,1]+1;// Increase the value of the array + 1;
              }
            if(body[1,1]==0)//Если в бинарной ячейке 1 то указуваем на цену выше - 0,00001
              {
               // Indicate the price
               double price=body[1,3]-0.00001;//Получаю цену указателя
               bodypips[1,0]=price;// Assign the price to the first box of the array. The array is filled with 0;
               bodypips[1,1]=bodypips[1,1]+1;// Increase the value of the array + 1;
              }

           }
         // ----- Processing the loop from the second line of the array -----
         Switch1=0;// Switch between iterations
         for(iaq=2; iaq<99999; iaq++)// Iterate through the body array
           {
            Switch1=0;// Assign 0 when re-entering the overflow
            if(body[iaq,0]>0 && body[iaq,0]<3)
              {
               // ---------- Processing 1 --------------
               if(body[iaq,1]==1)// If there is 1 in a binary cell, then indicate the price above + 0.00001
                 {

                  // Indicate the price
                  double price=body[iaq,0]+0.00001;// Get the price of the pointer
                  int findeprice=0;//
                  int Break1=0;//exit from enumeration 1
                  int Break2=0;//exit from enumeration 1
                  for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                    {
                     //Print("Price -7 ",price);
                     if(bodypips[ibq,0]==price)
                       {

                        //bodypips[ib,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                        bodypips[ibq,1]=bodypips[ibq,1]+1;
                        findeprice=1;// Assign 1 since we entered the body
                        Break1=1;// Assign 1 since we entered the body
                        Switch1=1;// Function executed; switch to column 3 is not necessary
                        break;

                       }
                     if(Break1==1)
                       {
                        break;
                       }
                    }

                  // ------ If there is no price, then add the price below ------
                  if(findeprice==0)// If the price is not found, then you need to add an entry to the arrayь
                    {
                     for(ibq=1; ibq<99999; ibq++)
                       {
                        if(bodypips[ibq,0]==0)
                          {
                           //Print("Price -6 ",price);
                           bodypips[ibq,0]=price;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;
                           Break2=1;
                           Switch1=1;
                           break;

                          }
                        if(Break2==1)
                          {
                           break;
                          }
                       }
                    }
                 }
               // ------ Processing 0 ------
               if(body[iaq,1]==0)// If in binary cell 1, then indicate the price higher - 0.00001
                 {

                  double price=body[iaq,0]-0.00001;// Get the price of the pointer
                  int findeprice=0;
                  int Break1=0;
                  int Break2=0;
                  Switch1=1;
                  for(ibq=1; ibq<99999; ibq++)
                    {
                     //Print("Price -5 ",price);
                     if(bodypips[ibq,0]==price)
                       {
                        //bodypips[ib,0]=price;
                        bodypips[ibq,1]=bodypips[ibq,1]+1;
                        findeprice=1;
                        Break1=1;
                        break;

                       }
                     if(Break1==1)
                       {
                        break;
                       }
                    }
                  // ------ If there is no price, then add the price below -------
                  if(findeprice==0)// If the price is not found, then you need to add an entry to the array
                    {
                     for(ibq=1; ibq<99999; ibq++)
                       {
                        if(bodypips[ibq,0]==0)
                          {
                           //Print("Price -4 ",price);
                           bodypips[ibq,0]=price;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;
                           Break2=1;
                           Switch1=1;
                           break;

                          }
                        if(Break2==1)
                          {
                           break;
                          }
                       }
                    }

                 }
               //---
              }
            if(Switch1==0)// If the switch is 1, then iterate over column 3
              {

               // ------- If the price record in the array is in column 3 ------
               if(body[iaq,3]>0 && body[iaq,3]<3)
                 {

                  if(body[iaq,1]==1)// If there is 1 in a binary cell, then indicate the price above + 0.00001
                    {

                     double price=body[iaq,3]+0.00001;
                     int findeprice=0;
                     int Break1=0;
                     int Break2=0;
                     for(ibq=1; ibq<99999; ibq++)
                       {
                        //Print("Price -3 ",price);
                        if(bodypips[ibq,0]==price)
                          {

                           //bodypips[ib,0]=price;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;
                           findeprice=1;
                           Break1=1;
                           break;

                          }
                        if(Break1==1)
                          {
                           break;
                          }
                       }

                     // ------- If there is no price, then add the price below ------
                     if(findeprice==0)//Если не найдена цена значит нужно добавить в массив запись
                       {
                        for(ibq=1; ibq<99999; ibq++)
                          {
                           if(bodypips[ibq,0]==0)
                             {
                              //Print("Price -2 ",price);
                              bodypips[ibq,0]=price;
                              bodypips[ibq,1]=bodypips[ibq,1]+1;
                              Break2=1;
                              break;

                             }
                           if(Break2==1)
                             {
                              break;
                             }
                          }
                       }
                    }

                  // ---------- Processing 0 ----------------
                  if(body[iaq,1]==0)// If in binary cell 1, then indicate the price higher - 0.00001
                    {

                     double price=body[iaq,3]-0.00001;
                     int findeprice=0;
                     int Break1=0;
                     int Break2=0;
                     for(ibq=1; ibq<99999; ibq++)
                       {
                        //Print("Price -1 ",price);
                        if(bodypips[ibq,0]==price)
                          {

                           //bodypips[ib,0]=price;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;
                           findeprice=1;
                           Break1=1;
                           break;

                          }
                        if(Break1==1)
                          {
                           break;
                          }
                       }

                     // ------ If there is no price, then add the price below ------
                     if(findeprice==0)
                       {
                        for(ibq=1; ibq<99999; ibq++)
                          {
                           if(bodypips[ibq,0]==0)
                             {
                              //Print("Price ",price);
                              bodypips[ibq,0]=price;
                              bodypips[ibq,1]=bodypips[ibq,1]+1;
                              Break2=1;
                              break;

                             }
                           if(Break2==1)
                             {
                              break;
                             }
                          }
                       }

                    }

                 }
              }
           }



         for(int ic=1; ic<99999; ic++)//Perebor stolbca 1
           {
            comp_bodypips[ic]=bodypips[ic,1];
            //Print("line 1031 ",bodypips[ic,1]);
            //Print("line 1032 ",bodypips[ic,0]);
            if(bodypips[ic,0]==0)
              {
               break;
              }

           }
         MaxInd_bodypips=ArrayMaximum(comp_bodypips,WHOLE_ARRAY,0);// Get the index in the array in which the binary code for the price showed the most

         // ----- Formula 2 - If the new price is higher than the previous one, then the resulting maximum is translated into pips and summed up to the previous price (price + 1) price
         // If the new price is less than the previous one, then the resulting maximum is translated into pips and minus the previous price (price-1) price.
         // The obtained result is compared with the current price. If the price has risen and the current price is less than price-1 plus pips, then the price is inside
         // If the price has dropped and the price is higher than the price-1 minus pips, then the price is inside I will Condition 0
         // If the price has risen and the current price is higher than the price-1 plus pips, then the price is outside
         // If the price has dropped and the price is less than price-1 minus pips, then the price is outside and I will Condition 1

         double PipsPrice=NormalizeDouble(pips_Menus_one*Point,5);


         BinInd3BO=10;
         BinInd3BE=10;
         if(bodypips[MaxInd_bodypips,0]>price_Menus_one)
           {
            price_plus=price_Menus_one+PipsPrice;// Summed to the price -1 pips of the maximum -1


            if(bodypips[MaxInd_bodypips,0]<price_plus)// If the current price is less than the Received price with pips, then the price inside is assigned 1
              {
               BinInd3=0;
               BinInd3BO=0;

               Bo="Bo_"+IntegerToString(BinInd3);
               //Подача значений на маховик
               Bo_0=1;//Подача значений для X
               z_Bo_0=1;//Подача значений для Z

              }
            if(bodypips[MaxInd_bodypips,0]>price_plus)
              {
               BinInd3=1;
               BinInd3BO=1;
               Bo="Bo_"+IntegerToString(BinInd3);
               //Подача значений на маховик
               Bo_1=1;//Подача значений для X
               z_Bo_1=1;//Подача значений для Z

              }
           }
         //------------------------------------------------

         if(bodypips[MaxInd_bodypips,0]<price_Menus_one)
           {
            price_minus=price_Menus_one-PipsPrice;
            if(bodypips[MaxInd_bodypips,0]>price_minus)
              {
               BinInd3=0;
               BinInd3BE=0;
               Be="Be_"+IntegerToString(BinInd3);
               //Подача значений на маховик
               Be_0=1;//Подача значений для X
               z_Be_0=1;//Подача значений для Z


              }
            if(bodypips[MaxInd_bodypips,0]<price_minus)
              {
               BinInd3=1;
               BinInd3BE=1;
               Be="Be_"+IntegerToString(BinInd3);
               //Подача значений на маховик
               Be_1=1;//Подача значений для X
               z_Be_1=1;//Подача значений для Z

              }
           }

         //-----Rotation-----
         //-----Ротация оси базируется на делении семечки подоснуха на 4 части.Присваиваются следующие индексы
         //-----Be_0,Bo_0 (Снисходящий тренд, восходящий тренд).Bе_1,Bo_1 (Снисходящий тренд, восходящий тренд)

         // -------- Binary price field scanner
         // -------- When the minute arrives, write the price change to the array, assigning the value obtained by the indicator
         // -------------- Phase 1 ------------- // Calculation. I get the number of pips traversed by the price for periods 1 and 2.

         // ----Модуль проверки конверсии перменных в модулях
         string Var1Wr;
         if(Var1_Bo_1==0)
           {
            Var1Wr="Bo_1";
           }
         if(Var1_Bo_0==0)
           {
            Var1Wr="Bo_0";
           }
         if(Var1_Be_0==0)
           {
            Var1Wr="Be_0";
           }
         if(Var1_Be_1==0)
           {
            Var1Wr="Be_1";
           }


         Price1=Price0;
         Price0=bodypips[MaxInd_bodypips,0];

         if(Price1!=0 && Price0!=0)
           {
            if(Price1<Price0)
              {
               CurPips=NormalizeDouble((Price0-Price1),5)*mult;//
              }
            if(Price1>Price0)
              {
               CurPips=NormalizeDouble((Price1-Price0),5)*mult;
              }


            // -------------- Phase 2 ------------- // Divide the received pips by the number of the indicator
            Onda1=NormalizeDouble(CurPips/bodypips[MaxInd_bodypips,1],5);
            //Print(" CurPips ",CurPips," Onda1 ",Onda1);

           }

         int indmas;//Index
         for(indmas=1; indmas<99999; indmas++)
           {
            if(PIPS_COL_Price[indmas,0]==0)
              {

               break;
              }
           }

         if(bodypips[MaxInd_bodypips,0]>price_Menus_one)
           {
            PIPS_COL_Price[indmas,2]=0;// Boolean type
            PIPS_COL_Price[indmas,3]=1;// Subtype 0/1
           }
         if(bodypips[MaxInd_bodypips,0]<price_Menus_one)
           {
            PIPS_COL_Price[indmas,2]=1;//Bear type
            PIPS_COL_Price[indmas,3]=0;// Subtype 0/1
           }


         //-----Time-----
         PIPS_COL_DT[indmas]=iTime(Symbol(),0,1);// record the time

         //-----Price------
         PIPS_COL_Price[indmas,0]=bodypips[MaxInd_bodypips,0];// Write the price to zero
         PIPS_COL_Price[indmas,1]=bodypips[MaxInd_bodypips,1];// Maximum index value-
         //-----Расчёт Маховик Времени
         for(int il=1; il<99999; il++)
           {
            //Print(bodypips[il,0]);
            if(bodypips[il,0]==0)
              {
               break;
              }
           }
         //---   Для вычисления полного цикла нужно иметь 2 переменные, Север и Юг
         //---   Переменная, реальность 1для внешнего кольца не изменяется а остаётся постоянной константой. Счётчик при смене с севера на юг считает в обратном порядке.при смене с юга на север считает в правильном порядке.
         //---   4 стороны плюс 2 переворота.1_2_3_4_0/1
         //---   Второй набор 1_2_3_4_0/1 часовые 1,2
         //---   Третий набор 1_2_3_4_0/1 часовые 3 и 4 1_0/1 отношение север юг
         //---   UP_BeBo0-1_0/1_1_2_3_4_0/1_1_2_3_4_0/1_1_2_3_4_0/1


         // Присваивание значений из подсолнуха. Нужно определить в какую из 4 переменных произведено присваивание.

         // Исходное положение Свеча компинсации. Переустановка начений
         if((resOperandMin==PriceZero || resOperandMax==PriceZero) && one_BE>=15 && one_BE<=60 && one_BE!=0 && Maximum>0 && Minimum>0 && Rez_BE==0&& Compens==true)
           {
            // Установка позиции маховика на Север
            sev=1;// обработка события Север
            zap=0;
            yug=0;
            vost=0;
            // Установка Лица
            lic=1;
            izn=0;
            // Снятие разрешение на установление севера
            Compens=false;
            // Установить значения массива на 0 и 1
            // Лицо
            Sev[1,1]=0;
            Sev[1,2]=0;
            Sev[1,3]=0;
            Sev[1,4]=0;
            // Изнанка
            Sev[1,5]=1;
            Sev[1,6]=1;
            Sev[1,7]=1;
            Sev[1,8]=1;
            Var1_Be_0=0;
            Var1_Bo_0=2;
            Var1_Be_1=2;
            Var1_Bo_1=2;
            Print(" Last Pips Sincronization ",iTime(Symbol(),PERIOD_M1,0));

            Gx=0;
            Gy=0;
            //Установление значений оси ЗЕТ "Z"
            z_sev=1;// обработка события Север
            z_zap=0;
            z_yug=0;
            z_vost=0;
            // Установка Лица
            z_lic=1;
            z_izn=0;
            
            z_Gx=0;
            z_Gy=0;
            z_Sev[1,1]=0;
            z_Sev[1,2]=0;
            z_Sev[1,3]=0;
            z_Sev[1,4]=0;
            // Изнанка
            z_Sev[1,5]=1;
            z_Sev[1,6]=1;
            z_Sev[1,7]=1;
            z_Sev[1,8]=1;
            z_Var1_Be_0=0;
            z_Var1_Bo_0=2;
            z_Var1_Be_1=2;
            z_Var1_Bo_1=2;
            
            int file_handle14=FileOpen(FileName14,FILE_READ|FILE_WRITE," ");
            if(file_handle14>0)
              {


               FileSeek(file_handle14,0,SEEK_END);
               FileWrite(file_handle14,Symbol()," Start Time for flywheel ",iTime(Symbol(),0,1));
               FileClose(file_handle14);

              }
            //Установка в 0 исходных переменных при лице

            //Print(" Fly INIT ",Sev[1,1],Sev[1,2],Sev[1,3],Sev[1,4],Sev[1,5],Sev[1,6],Sev[1,7],Sev[1,8]);
            //Print(" Step 0 "," sev ",sev," zap ",zap," yug ",yug," vost ",vost );
           }//Fin init
         //Print("Step2 ",Be_0," -Be_0 ",Bo_0," -Bo_0 ",Be_1," -Be_1 ",Bo_1," -Bo_1 ");
         //Print("Nueva ronda ",Var1_Be_0," Var1_Be_0 ",Var1_Bo_0," Var1_Bo_0 ",Var1_Be_1," Var1_Be_1 ",Var1_Bo_1," Var1_Bo_ ");
         //Подача значений
         if(Be_0==1)
           {
            Var2_Be_0=1;
            Var2_Bo_0=2;
            Var2_Be_1=2;
            Var2_Bo_1=2;
            Be_0=0;
            Bo_0=0;
            Be_1=0;
            Bo_1=0;

           }
         if(Bo_0==1)
           {
            Var2_Be_0=2;
            Var2_Bo_0=1;
            Var2_Be_1=2;
            Var2_Bo_1=2;
            Be_0=0;
            Bo_0=0;
            Be_1=0;
            Bo_1=0;
           }
         if(Be_1==1)
           {
            Var2_Be_1=1;
            Var2_Be_0=2;
            Var2_Bo_0=2;
            Var2_Bo_1=2;
            Be_0=0;
            Bo_0=0;
            Be_1=0;
            Bo_1=0;

           }
         if(Bo_1==1)
           {
            Var2_Bo_1=1;
            Var2_Be_0=2;
            Var2_Bo_0=2;
            Var2_Be_1=2;
            Be_0=0;
            Bo_0=0;
            Be_1=0;
            Bo_1=0;

           }

         // Варианты вращение в правильной позиции. Смена строны производится мо методу переварота страницы в книге с лева на право или с права на лево
         // Вращение производится базируясь на вторую переменную. После присваивания и расчёта значения из второй переменной перетекают в первую.
         //Перед обработкой событий нужно выявить все правила для каждого направления.
         //Переприсваивание значения в тойже плоскости и том же лице если выпало тоже самое значение.Пример Be_0 и Be_0
         // Назначение переменной
         if(Var1_Be_0==0 && Var2_Be_0==1)
           {
            Var1_Bo_0=0;
            Var2_Be_0=1;

           }
         if(Var1_Be_0==2 && Var2_Be_0==1)
           {
            Var2_Be_0=1;

           }
         if(Var1_Bo_0==0 && Var2_Bo_0==1)
           {
            Var1_Be_0=0;
            Var2_Bo_0=1;

           }
         if(Var1_Bo_0==2 && Var2_Bo_0==1)
           {
            Var2_Bo_0=1;

           }
         if(Var1_Be_1==0 && Var2_Be_1==1)
           {
            Var1_Bo_1=0;
            Var2_Be_1=1;

           }
         if(Var1_Be_1==2 && Var2_Be_1==1)
           {
            Var2_Be_1=1;

           }
         if(Var1_Bo_1==0 && Var2_Bo_1==1)
           {
            Var1_Be_1=0;
            Var2_Bo_1=1;

           }
         if(Var1_Bo_1==2 && Var2_Bo_1==1)
           {
            Var2_Bo_1=1;

           }//CHeck ok


         //Print("Step3 ",Var1_Be_0," Var1_Be_0 ",Var1_Bo_0," Var1_Bo_0 ",Var1_Be_1," Var1_Be_1 ",Var1_Bo_1," Var1_Bo_1 ");
         //Print("Step4 ",Var2_Be_0," Var2_Be_0 ",Var2_Bo_0," Var2_Bo_0 ",Var2_Be_1," Var2_Be_1 ",Var2_Bo_1," Var2_Bo_1 ");
         ArrayInitialize(errorprint,0);
         bool ChekDIr=true;//еременная разрешающая 1 раз в цикл анализиравать блок направлений по компасу
         string BlockNum="0";
         // Правильная конфигурация Север
         // 1
         // Правильная конфигурация Север
         // 1
         if(sev==1 && Var1_Be_0==0 && Var2_Bo_0==1 && ChekDIr==true)
           {
            Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 1";
            errorprint[1]=1;
           }
         // 2
         if(sev==1 && Var1_Bo_0==0 && Var2_Be_0==1 && ChekDIr==true)
           {
            Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 2";
            errorprint[2]=1;
           }
         // 3
         if(sev==1 && Var1_Be_1==0 && Var2_Bo_1==1 && ChekDIr==true)
           {
            Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 3";
            errorprint[3]=1;
           }
         // 4
         if(sev==1 && Var1_Bo_1==0 && Var2_Be_1==1 && ChekDIr==true)
           {
            Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 4";
            errorprint[4]=1;
           }
         // 5
         // Не правильная конфигурация
         if(sev==1 && Var1_Be_0==0 && Var2_Bo_1==1 && ChekDIr==true)  //Смещение по регистру с Севера *| на Запад «-
           {
            // разрешение на обработку события.
            Vost_1=1;
            Sev_1=0;
            Zap_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="S 5";
            errorprint[5]=1;
            Var1_Be_0=2;
			Var1_Be_1=0;
           }
         // 6
         if(sev==1 && Var1_Bo_1==0 && Var2_Be_0==1 && ChekDIr==true)  // Смещение по регистру с Севера *| на Запад «-
           {
            // разрешение на обработку события.
            Zap_1=1;
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 6";
            errorprint[6]=1;
           Var1_Bo_1=2;
		   Var1_Bo_0=0;
            
            
           }
         // 7
         if(sev==1 && Var1_Bo_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Севера *| на Восток -»
           {
            // разрешение на обработку события.
            Vost_1=0;
            //Запрет для 3 направлений
            Zap_1=1;
            Sev_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="S 7";
            errorprint[7]=1;
            Var1_Bo_0=2;
			Var1_Bo_1=0;
            
           }
         // 8
         if(sev==1 && Var1_Be_1==0 && Var2_Bo_0==1 && ChekDIr==true)  // Смещение по регистру с Севера *| на Восток -»
           {
            // разрешение на обработку события.
            Vost_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="S 8";
            errorprint[8]=1;
            Var1_Be_1=2;
			Var1_Be_0=0;
            
            
           }
         // 9
         if(sev==1 && Var1_Bo_0==0 && Var2_Bo_1==1 && ChekDIr==true)  // Смещение по регистру с Севера *| на Юг .|
           {
            Yug_1=1;
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="S 9";
            errorprint[9]=1;
            Var1_Bo_0=2;
			Var1_Be_1=0;
			
			
			
           }
         // 10
         if(sev==1 && Var1_Bo_1==0 && Var2_Bo_0==1 && ChekDIr==true) // Смещение по регистру с Севера *|  на Юг .|
           {
            Yug_1=1;
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;

            //Var1_Be_1=0;
            //Var2_Bo_1=1;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="S 10";
            errorprint[10]=1;
            Var1_Bo_1=2;
			Var1_Be_0=0;
			
           }
         // 11
         if(sev==1 && Var1_Be_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Севера *|  на Юг .|
           {
            Yug_1=1;
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
             
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="S 11";
            errorprint[11]=1;
            Var1_Be_0=2;
			Var1_Bo_1=0;
           }
         // 12
         if(sev==1 && Var1_Be_1==0 && Var2_Be_0==1 && ChekDIr==true)  // Смещение по регистру с Севера *|  на Юг .|
           {
            Yug_1=1;
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="S 12";
            errorprint[12]=1;
            Var1_Be_1=2;
			Var1_Bo_0=0;
           }

         //__________________________________
         // Правильная конфигурация Запад
         if(zap==1 && Var1_Be_0==0 && Var2_Bo_0==1 && ChekDIr==true)
           {
            Zap_1=1;// разрешение на обработку события.
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 1";
            errorprint[13]=1;

           }
         // 2
         if(zap==1 && Var1_Bo_0==0 && Var2_Be_0==1 && ChekDIr==true)
           {
            Zap_1=1;// разрешение на обработку события.
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 2";
            errorprint[14]=1;
           }
         // 3
         if(zap==1 && Var1_Be_1==0 && Var2_Bo_1==1 && ChekDIr==true)
           {
            Zap_1=1;// разрешение на обработку события.
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 3";
            errorprint[5]=1;
           }
         // 4
         if(zap==1 && Var1_Bo_1==0 && Var2_Be_1==1 && ChekDIr==true)
           {
            Zap_1=1;// разрешение на обработку события.
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 4";
            errorprint[16]=1;
           }
         // 5
         // Не правильная конфигурация
         if(zap==1 && Var1_Be_0==0 && Var2_Bo_1==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на Эг |. Смещение против часовой стрелки.
           {
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=1;
           //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 5";
            errorprint[17]=1;
            Var1_Be_0=2;
			Var1_Be_1=0;
            
            
           }
         // 6
         if(zap==1 && Var1_Bo_1==0 && Var2_Be_0==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на Эг |. Смещение против часовой стрелки.
           {
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=1;
           //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 6";
            errorprint[18]=1;
            Var1_Bo_1=2;
			Var1_Bo_0=0;
            
           }
         // 7
         if(zap==1 && Var1_Bo_0==0 && Var2_Be_1==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на Севера *| Смещение по часовой стрелке
           {
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=1;
           //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 7";
            errorprint[19]=1;
            Var1_Bo_0=2;
			Var1_Bo_1=0;
            
           }
         // 8
         if(zap==1 && Var1_Be_1==0 && Var2_Bo_0==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на Севера *| Смещение по часовой стрелке
           {
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=1;
            //Var2_Be_0=1;
           //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Z 8";
            errorprint[20]=1;
            Var1_Be_1=2;
			Var1_Be_0=0;
            

           }
         // 9
         if(zap==1 && Var1_Bo_0==0 && Var2_Bo_1==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            Vost_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Zap_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Z 9";
            errorprint[21]=1;
           Var1_Bo_0=2;
		   Var1_Be_1=0;

           }
         // 10
         if(zap==1 && Var1_Bo_1==0 && Var2_Bo_0==1 && ChekDIr==true) //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            Vost_1=1;
            // разрешение на обработку события.
            Zap_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Yug_1=0;
           //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Z 10";
            errorprint[22]=1;
            Var1_Bo_1=2;
			Var1_Be_0=0;
           }
         // 11
         if(zap==1 && Var1_Be_0==0 && Var2_Be_1==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            Vost_1=1;
            // разрешение на обработку события.
            Zap_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Yug_1=0;
           //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Z 11";
            errorprint[23]=1;
            Var1_Be_0=2;
			Var1_Bo_1=0;
           }
         // 12
         if(zap==1 && Var1_Be_1==0 && Var2_Be_0==1 && ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            Vost_1=1;
            // разрешение на обработку события.
            Zap_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Z 12";
            errorprint[24]=1;
            Var1_Be_1=2;
			Var1_Bo_0=0;
           }
         //__________________________________

         // Правильная конфигурация Восток
         if(vost==1 && Var1_Be_0==0 && Var2_Bo_0==1 && ChekDIr==true)
           {
            Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="V 1";
            errorprint[25]=1;
           }
         // 2
         if(vost==1 && Var1_Bo_0==0 && Var2_Be_0==1 && ChekDIr==true)
           {
            Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="V 2";
            errorprint[26]=1;
           }
         // 3
         if(vost==1 && Var1_Be_1==0 && Var2_Bo_1==1 && ChekDIr==true)
           {
            Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="V 3";
            errorprint[27]=1;
           }
         // 4
         if(vost==1 && Var1_Bo_1==0 && Var2_Be_1==1 && ChekDIr==true)
           {
            Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="V 4";
            errorprint[28]=1;
           }
         // 5
         // Не правильная конфигурация
         if(vost==1 && Var1_Be_0==0 && Var2_Bo_1==1 && ChekDIr==true)  //Смещение по регистру с Востока -» на Север *| . 9 часов
           {
            // разрешение на обработку события.
            Sev_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=1;
           //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="V 5";
            errorprint[29]=1;
            Var1_Be_0=2;
			Var1_Be_1=0;
            
            
           }
         // 6
         if(vost==1 && Var1_Bo_1==0 && Var2_Be_0==1 && ChekDIr==true)  //Смещение по регистру с Востока -» на Север *|   9 часов
           {
            // разрешение на обработку события.
            Sev_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 6";
            errorprint[30]=1;
            Var1_Bo_1=2;
			Var1_Bo_0=0;
            
           }
         // 7
         if(vost==1 && Var1_Bo_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Востока -» на Юг .|  3 часа
           {
            // разрешение на обработку события.
            Sev_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 7";
            errorprint[31]=1;
           Var1_Bo_0=2;
		   Var1_Bo_1=0;
            
           }
         // 8
         if(vost==1 && Var1_Be_1==0 && Var2_Bo_0==1 && ChekDIr==true)  // Смещение по регистру с Востока -» на Юг .|  3 часа
           {
            // разрешение на обработку события.
            Yug_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="V 8";
            errorprint[32]=1;
             Var1_Be_1=2;
			 Var1_Be_0=0;
            
           }
         // 9
         if(vost==1 && Var1_Bo_0==0 && Var2_Bo_1==1 && ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            Zap_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Vost_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 9";
            errorprint[33]=1;
			Var1_Bo_0=2;
			Var1_Be_1=0;
           }
         // 10
         if(vost==1 && Var1_Bo_1==0 && Var2_Bo_0==1 && ChekDIr==true) // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            Zap_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Vost_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 10";
            errorprint[34]=1;
           Var1_Bo_1=2;
		   Var1_Be_0=0;
           }
         // 11
         if(vost==1 && Var1_Be_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            Zap_1=1;
            // разрешение на обработку события.
            Vost_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 11";
            errorprint[35]=1;
           Var1_Be_0=2;
		   Var1_Bo_1=0;
		   
           }
         // 12
         if(vost==1 && Var1_Be_1==0 && Var2_Be_0==1 && ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            Zap_1=1;
            // разрешение на обработку события.
            Vost_1=0;
            //Запрет для 3 направлений
            Sev_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="V 12";
            errorprint[36]=1;
            Var1_Be_1=2;
			Var1_Bo_0=0;
           }
         //__________________________________
         // Правильная конфигурация Юг
         // 1
         if(yug==1 && Var1_Be_0==0 && Var2_Bo_0==1 && ChekDIr==true)
           {
            Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 1";
            errorprint[37]=1;

           }
         // 2
         if(yug==1 && Var1_Bo_0==0 && Var2_Be_0==1 && ChekDIr==true)
           {
            Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 2";
            errorprint[38]=1;
           }
         // 3
         if(yug==1 && Var1_Be_1==0 && Var2_Bo_1==1 && ChekDIr==true)
           {
            Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 3";
            errorprint[39]=1;
           }
         // 4
         if(yug==1 && Var1_Bo_1==0 && Var2_Be_1==1 && ChekDIr==true)
           {
            Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Sev_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=1;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 4";
            errorprint[40]=1;
           }
         // 5
         // Не правильная конфигурация
         if(yug==1 && Var1_Be_0==0 && Var2_Bo_1==1 && ChekDIr==true)  //Смещение по регистру с Юга на .| на Восток -» 9 часов
           {
            // разрешение на обработку события.
            Zap_1=1;
            //Запрет для 3 направлений
            Vost_1=0;
            Sev_1=0;
            Yug_1=0;
          
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 5";
            errorprint[41]=1;
         Var1_Be_0=2;
		 Var1_Be_1=0;
            
            
           }
         // 6
         if(yug==1 && Var1_Bo_1==0 && Var2_Be_0==1 && ChekDIr==true)  //Смещение по регистру с Юга на .| на Восток -» 9 часов
           {
            // разрешение на обработку события.
            Vost_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Sev_1=0;
            Yug_1=0;
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Y 6";
            errorprint[42]=1;
            Var1_Bo_1=2;
			Var1_Bo_0=0;
            
            
           }
         // 7
         if(yug==1 && Var1_Bo_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Юга на .| на  Запад «- 3 часа
           {
            // разрешение на обработку события.
            Vost_1=1;
            //Запрет для 3 нап равлений
            Sev_1=0;
            Zap_1=0;
            Yug_1=0;
            
            //Проверка значения направления
            sev=0;
            zap=0;
            yug=0;
            vost=1;
            ChekDIr=false;
            BlockNum="Y 7";
            errorprint[43]=1;
            Var1_Bo_0=2;
			Var1_Bo_1=0;
            
            
           }
         // 8
         if(yug==1 && Var1_Be_1==0 && Var2_Bo_0==1 && ChekDIr==true)  // Смещение по регистру с Юга на .| на Запад «- 3 часа
           {
            // разрешение на обработку события.
            Zap_1=1;
            //Запрет для 3 направлений
            Sev_1=0;
            Vost_1=0;
            Yug_1=0;
       
            //Проверка значения направления
            sev=0;
            zap=1;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 8";
            errorprint[44]=1;
           Var1_Be_1=2;
		   Var1_Be_0=0;
            
            
           }
         // 9
         if(yug==1 && Var1_Bo_0==0 && Var2_Bo_1==1 && ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            Sev_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;

            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 9";
            errorprint[45]=1;
            Var1_Bo_0=2;
			Var1_Be_1=0;
            
           }
         // 10
         if(yug==1 && Var1_Bo_1==0 && Var2_Bo_0==1 && ChekDIr==true) // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            Sev_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 10";
            errorprint[46]=1;
            Var1_Bo_1=2;
			Var1_Be_0=0;
            
           }
         // 11
         if(yug==1 && Var1_Be_0==0 && Var2_Be_1==1 && ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            Sev_1=1;
            // разрешение на обработку события.
            Yug_1=0;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;

           //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 11";
            errorprint[47]=1;
			Var1_Be_0=2;
			Var1_Bo_1=0;
            
          
           }
         // 12
         if(yug==1 && Var1_Be_1==0 && Var2_Be_0==1 && ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            // разрешение на обработку события.
            Sev_1=1;
            //Запрет для 3 направлений
            Zap_1=0;
            Vost_1=0;
            Yug_1=0;
         
            //Проверка значения направления
            sev=1;
            zap=0;
            yug=0;
            vost=0;
            ChekDIr=false;
            BlockNum="Y 12";
            errorprint[48]=1;
			Var1_Be_1=2;
			Var1_Bo_0=0;
           
           }

         //Проверка шаг 3
         string napravlenie;
         if(Sev_1==1)
           {
            napravlenie="Sev_1";
           }
         if(Yug_1==1)
           {
            napravlenie="Yug_1";
           }
         if(Zap_1==1)
           {
            napravlenie="Zap_1";
           }
         if(Vost_1==1)
           {
            napravlenie="Vost_1";
           }
         //Print(napravlenie);
         // 4 направления в которых вложены 2 стороны и 8 регистров. В сумме 768 регистров
         // ечать ошибок блока разрешений для индикатора Семечка
         //for(int gh=1;gh<49;gh++)
         //{
         //Print("index ",gh);
         //Print("errorprint ",errorprint[gh]);

         ArrayInitialize(errorprint2,0);
         //}
         //Поведение северной стороны
         if(Sev_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(lic==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,2]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[1]=1;//Proverka zapuska bloka
                 }
               if(Sev[1,2]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,6]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[2]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,6]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[3]=1;
                 }
               if(Sev[1,6]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,2]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[4]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(lic==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,1]==0 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[5]=1;
                 }
               if(Sev[1,1]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,5]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[6]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,5]==0 && Var2_Be_0==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[6]=1;
                 }
               if(Sev[1,5]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,1]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[7]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(lic==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,4]==0 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[8]=1;
                 }
               if(Sev[1,4]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,8]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[9]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,8]==0 && Var2_Bo_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[10]=1;
                 }
               if(Sev[1,8]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,4]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[11]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(lic==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,3]==0 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[12]=1;
                 }
               if(Sev[1,3]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,7]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[13]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,7]==0 && Var2_Be_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[14]=1;
                 }
               if(Sev[1,7]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,3]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[15]=1;
                 }
              }// izn==1 фин

            


           }// Sever фин
         //_____________________________________
         // Поведение Юг
         if(Yug_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(lic==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,4]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[32]=1;
                 }
               if(Sev[1,4]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,8]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[33]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,8]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[34]=1;
                 }
               if(Sev[1,8]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,4]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[35]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(lic==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,3]==0 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[36]=1;
                 }
               if(Sev[1,3]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,7]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[37]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,7]==0 && Var2_Be_0==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[38]=1;
                 }
               if(Sev[1,7]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,3]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[39]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(lic==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,2]==0 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[40]=1;
                 }
               if(Sev[1,2]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,6]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[41]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,6]==0 && Var2_Bo_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[42]=1;
                 }
               if(Sev[1,6]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,2]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gx++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[43]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(lic==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,1]==0 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[44]=1;
                 }
               if(Sev[1,1]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,5]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[45]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,5]==0 && Var2_Be_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[46]=1;
                 }
               if(Sev[1,5]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,1]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gx--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[47]=1;
                 }
              }// izn==1 фин

            


           }// Yug фин
         //___________________________________
         // Поведение Запад
         if(Zap_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(lic==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,3]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[64]=1;
                 }
               if(Sev[1,3]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,5]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[65]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,5]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[66]=1;
                 }
               if(Sev[1,5]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,3]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[67]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(lic==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,2]==0 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[68]=1;
                 }
               if(Sev[1,2]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,8]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[69]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,8]==0 && Var2_Be_0==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[70]=1;
                 }
               if(Sev[1,8]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,2]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[71]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(lic==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,1]==0 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[72]=1;
                 }
               if(Sev[1,1]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,7]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[73]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,7]==0 && Var2_Bo_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[74]=1;
                 }
               if(Sev[1,7]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,1]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[75]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(lic==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,4]==0 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,4]=1;//ПРОВЕРИТъ Должно быть 1,4 Смена в регистре на противоположное значение на лице
                  Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[76]=1;
                 }
               if(Sev[1,4]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,6]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[77]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,6]==0 && Var2_Be_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,6]=1;//Проверить 1,7 Смена в регистре на противоположное значение на лице
                  Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[78]=1;
                 }
               if(Sev[1,6]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 { 
                  Sev[1,4]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[79]=1;
                 }
              }// izn==1 фин

            


           }// Zapad фин

         //___________________________________
         // Поведение Восток
         if(Vost_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(lic==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,1]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[96]=1;
                 }
               if(Sev[1,1]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,7]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[97]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_0==0 && Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,7]==0 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[98]=1;
                 }
               if(Sev[1,7]==1 && Var2_Bo_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,1]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=0;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[99]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(lic==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,4]==0 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[100]=1;
                 }
               if(Sev[1,4]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,6]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[101]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_0==0 && Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,6]==0 && Var2_Be_0==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[102]=1;
                 }
               if(Sev[1,6]==1 && Var2_Be_0==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,4]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=0;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=2;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[103]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(lic==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,3]==0 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[104]=1;
                 }
               if(Sev[1,3]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,5]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[105]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Be_1==0 && Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,5]==0 && Var2_Bo_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[106]=1;
                 }
               if(Sev[1,5]==1 && Var2_Bo_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,3]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=2;
                  Var1_Bo_1=0;
                  //----------
                  Gy++;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[107]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(lic==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,2]==0 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[108]=1;
                 }
               if(Sev[1,2]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,8]=0;
                  lic=0;//Смена Стороны
                  izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[109]=1;
                 }
              }// lic==1 фин
            if(izn==1 && Var1_Bo_1==0 && Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(Sev[1,8]==0 && Var2_Be_1==1 && BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[110]=1;
                 }
               if(Sev[1,8]==1 && Var2_Be_1==1 && BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  Sev[1,2]=0;
                  lic=1;//Смена Стороны
                  izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  Var1_Be_0=2;
                  Var1_Bo_0=2;
                  Var1_Be_1=0;
                  Var1_Bo_1=2;
                  //----------
                  Gy--;
                  Var2_Be_0=2;
                  Var2_Bo_0=2;
                  Var2_Be_1=2;
                  Var2_Bo_1=2;
                  BlockPermis=false;
                  errorprint2[111]=1;
                 }
              }// izn==1 фин

            

           }// Vostok фин
         //Праверка шаг 4
         string face;
         if(lic==1)
           {
            face="lic";
           }
         if(izn==1)
           {
            face="izn";
           }
         //-----
         //--Проверка на колличество входов в блоки
         int err2=0;
         for(int yk=0; yk<150; yk++)
           {
            if(errorprint2[yk]==1)
              {
               err2++;
              }
           }
         string Sterr2;
         Sterr2=IntegerToString(err2);
         //--Вращение Оси Z
         if(z_Be_0==1)
           {
            z_Var2_Be_0=1;
            z_Var2_Bo_0=2;
            z_Var2_Be_1=2;
            z_Var2_Bo_1=2;
            z_Be_0=0;
            z_Bo_0=0;
            z_Be_1=0;
            z_Bo_1=0;

           }
         if(z_Bo_0==1)
           {
            z_Var2_Be_0=2;
            z_Var2_Bo_0=1;
            z_Var2_Be_1=2;
            z_Var2_Bo_1=2;
            z_Be_0=0;
            z_Bo_0=0;
            z_Be_1=0;
            z_Bo_1=0;
           }
         if(z_Be_1==1)
           {
            z_Var2_Be_1=1;
            z_Var2_Be_0=2;
            z_Var2_Bo_0=2;
            z_Var2_Bo_1=2;
            z_Be_0=0;
            z_Bo_0=0;
            z_Be_1=0;
            z_Bo_1=0;

           }
         if(z_Bo_1==1)
           {
            z_Var2_Bo_1=1;
            z_Var2_Be_0=2;
            z_Var2_Bo_0=2;
            z_Var2_Be_1=2;
            z_Be_0=0;
            z_Bo_0=0;
            z_Be_1=0;
            z_Bo_1=0;

           }

         // Варианты вращение в правильной позиции. Смена строны производится мо методу переварота страницы в книге с лева на право или с права на лево
         // Вращение производится базируясь на вторую переменную. После присваивания и расчёта значения из второй переменной перетекают в первую.
         //Перед обработкой событий нужно выявить все правила для каждого направления.
         //Переприсваивание значения в тойже плоскости и том же лице если выпало тоже самое значение.Пример Be_0 и Be_0
         // Назначение переменной
         if(z_Var1_Be_0==0 && z_Var2_Be_0==1)
           {
            z_Var1_Bo_0=0;
            z_Var2_Be_0=1;

           }
         if(z_Var1_Be_0==2 && z_Var2_Be_0==1)
           {
            z_Var2_Be_0=1;

           }
         if(z_Var1_Bo_0==0 && z_Var2_Bo_0==1)
           {
            z_Var1_Be_0=0;
            z_Var2_Bo_0=1;

           }
         if(z_Var1_Bo_0==2 && z_Var2_Bo_0==1)
           {
            z_Var2_Bo_0=1;

           }
         if(z_Var1_Be_1==0 && z_Var2_Be_1==1)
           {
            z_Var1_Bo_1=0;
            z_Var2_Be_1=1;

           }
         if(z_Var1_Be_1==2 && z_Var2_Be_1==1)
           {
            z_Var2_Be_1=1;

           }
         if(z_Var1_Bo_1==0 && z_Var2_Bo_1==1)
           {
            z_Var1_Be_1=0;
            z_Var2_Bo_1=1;

           }
         if(z_Var1_Bo_1==2 && z_Var2_Bo_1==1)
           {
            z_Var2_Bo_1=1;

           }//CHeck ok


         //Print("Step3 ",Var1_Be_0," Var1_Be_0 ",Var1_Bo_0," Var1_Bo_0 ",Var1_Be_1," Var1_Be_1 ",Var1_Bo_1," Var1_Bo_1 ");
         //Print("Step4 ",Varz_Be_0," Varz_Be_0 ",Varz_Bo_0," Varz_Bo_0 ",Varz_Be_1," Varz_Be_1 ",Varz_Bo_1," Varz_Bo_1 ");
         ArrayInitialize(z_errorprint,0);
         bool z_ChekDIr=true;//еременная разрешающая 1 раз в цикл анализиравать блок направлений по компасу
         z_BlockNum="0";
         // Правильная конфигурация Север
         // 1
         // Правильная конфигурация Север
         // 1
         if(z_sev==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)
           {
            z_Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 1";
            z_errorprint[1]=1;
           }
         // 2
         if(z_sev==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1 && z_ChekDIr==true)
           {
            z_Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 2";
            z_errorprint[2]=1;
           }
         // 3
         if(z_sev==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)
           {
            z_Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 3";
            z_errorprint[3]=1;
           }
         // 4
         if(z_sev==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1 && z_ChekDIr==true)
           {
            z_Sev_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 4";
            z_errorprint[4]=1;
           }
         // 5
         // Не правильная конфигурация
         if(z_sev==1 && z_Var1_Be_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  //Смещение по регистру с Севера *| на Запад «-
           {
            // разрешение на обработку события.
            z_Vost_1=0;
            z_Sev_1=0;
            z_Zap_1=0;
            z_Yug_1=1;
            
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 5";
            z_errorprint[5]=1;
            z_Var1_Be_0=2;
			z_Var1_Be_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 6
         if(z_sev==1 && z_Var1_Bo_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *| на Запад «-
           {
            // разрешение на обработку события.
            z_Zap_1=0;
            z_Sev_1=0;
            z_Vost_1=0;
            z_Yug_1=1;
            
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 6";
            z_errorprint[6]=1;
            z_Var1_Bo_1=2;
			z_Var1_Bo_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 7
         if(z_sev==1 && z_Var1_Bo_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *| на Восток -»
           {
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=1;
            
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 7";
            z_errorprint[7]=1;
           z_Var1_Bo_0=2;
		   z_Var1_Bo_1=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 8
         if(z_sev==1 && z_Var1_Be_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *| на Восток -»
           {
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=1;
            
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 8";
            z_errorprint[8]=1;
            z_Var1_Be_1=2;
			z_Var1_Be_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 9
         if(z_sev==1 && z_Var1_Bo_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *| на Юг .|
           {
            z_Yug_1=0;
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="S 9";
            z_errorprint[9]=1;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 10
         if(z_sev==1 && z_Var1_Bo_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true) // Смещение по регистру с Севера *|  на Юг .|
           {
            z_Yug_1=0;
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;

            //Var1_Be_1=0;
            //Varz_Bo_1=1;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="S 10";
            z_errorprint[10]=1;
            z_Var1_Bo_1=2;
			z_Var1_Be_0=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 11
         if(z_sev==1 && z_Var1_Be_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *|  на Юг .|
           {
            z_Yug_1=0;
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
             
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="S 11";
            z_errorprint[11]=1;
			z_Var1_Be_0=2;
			z_Var1_Bo_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 12
         if(z_sev==1 && z_Var1_Be_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  // Смещение по регистру с Севера *|  на Юг .|
           {
            z_Yug_1=0;
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="S 12";
            z_errorprint[12]=1;
			z_Var1_Be_1=2;
			z_Var1_Bo_0=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }

         //__________________________________
         // Правильная конфигурация Запад
         if(z_zap==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)
           {
            z_Zap_1=1;// разрешение на обработку события.
            z_Sev_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 1";
            z_errorprint[13]=1;

           }
         // 2
         if(z_zap==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1 && z_ChekDIr==true)
           {
            z_Zap_1=1;// разрешение на обработку события.
            z_Sev_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 2";
            z_errorprint[14]=1;
           }
         // 3
         if(z_zap==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)
           {
            z_Zap_1=1;// разрешение на обработку события.
            z_Sev_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 3";
            z_errorprint[5]=1;
           }
         // 4
         if(z_zap==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1 && z_ChekDIr==true)
           {
            z_Zap_1=1;// разрешение на обработку события.
            z_Sev_1=0;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 4";
            z_errorprint[16]=1;
           }
         // 5
         // Не правильная конфигурация
         if(z_zap==1 && z_Var1_Be_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на Эг |. Смещение против часовой стрелки.
           {
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            z_Sev_1=0;
           //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Z 5";
            z_errorprint[17]=1;
            z_Var1_Be_0=2;
            z_Var1_Be_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 6
         if(z_zap==1 && z_Var1_Bo_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на Эг |. Смещение против часовой стрелки.
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            z_Yug_1=0;
           //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Z 6";
            z_errorprint[18]=1;
            z_Var1_Bo_1=2;
			z_Var1_Bo_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 7
         if(z_zap==1 && z_Var1_Bo_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на Севера *| Смещение по часовой стрелке
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            z_Yug_1=0;
           //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Z 7";
            z_errorprint[19]=1;
            z_Var1_Bo_0=2;
			z_Var1_Bo_1=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 8
         if(z_zap==1 && z_Var1_Be_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на Севера *| Смещение по часовой стрелке
           {
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            z_Sev_1=0;
            //Varz_Be_0=1;
           //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Z 8";
            z_errorprint[20]=1;
            z_Var1_Be_1=2;
			z_Var1_Be_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }

           }
         // 9
         if(z_zap==1 && z_Var1_Bo_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            z_Vost_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Sev_1=1;
            z_Zap_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 9";
            z_errorprint[21]=1;
            z_Var1_Bo_0=2;
			z_Var1_Be_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }

           }
         // 10
         if(z_zap==1 && z_Var1_Bo_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true) //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            z_Vost_1=0;
            // разрешение на обработку события.
            z_Zap_1=0;
            //Запрет для 3 направлений
            z_Sev_1=1;
            z_Yug_1=0;
           //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 10";
            z_errorprint[22]=1;
			z_Var1_Bo_1=2;
			z_Var1_Be_0=0;
//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 11
         if(z_zap==1 && z_Var1_Be_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            z_Vost_1=0;
            // разрешение на обработку события.
            z_Zap_1=0;
            //Запрет для 3 направлений
            z_Sev_1=0;
            z_Yug_1=1;
           //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 11";
            z_errorprint[23]=1;
           z_Var1_Be_0=2;
		   z_Var1_Bo_1=0;
		   //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 12
         if(z_zap==1 && z_Var1_Be_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  //Смещение по регистру с Запада «- на ВОсток -» Смещение 180 градусов
           {
            z_Vost_1=0;
            // разрешение на обработку события.
            z_Zap_1=0;
            //Запрет для 3 направлений
            z_Sev_1=0;
            z_Yug_1=1;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Z 12";
            z_errorprint[24]=1;
            z_Var1_Be_1=2;
			z_Var1_Bo_0=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         //__________________________________

         // Правильная конфигурация Восток
         if(z_vost==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)
           {
            z_Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="V 1";
            z_errorprint[25]=1;
           }
         // 2
         if(z_vost==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1 && z_ChekDIr==true)
           {
            z_Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="V 2";
            z_errorprint[26]=1;
           }
         // 3
         if(z_vost==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)
           {
            z_Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="V 3";
            z_errorprint[27]=1;
           }
         // 4
         if(z_vost==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1 && z_ChekDIr==true)
           {
            z_Vost_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="V 4";
            z_errorprint[28]=1;
           }
         // 5
         // Не правильная конфигурация
         if(z_vost==1 && z_Var1_Be_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  //Смещение по регистру с Востока -» на Север *| . 9 часов
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            z_Yug_1=0;
           //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 5";
            z_errorprint[29]=1;
            z_Var1_Be_0=2;
			z_Var1_Be_1=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 6
         if(z_vost==1 && z_Var1_Bo_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  //Смещение по регистру с Востока -» на Север *|   9 часов
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 6";
            z_errorprint[30]=1;
            z_Var1_Bo_1=2;
			z_Var1_Bo_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 7
         if(z_vost==1 && z_Var1_Bo_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Востока -» на Юг .|  3 часа
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 7";
            z_errorprint[31]=1;
           z_Var1_Bo_0=2;
		   z_Var1_Bo_1=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 8
         if(z_vost==1 && z_Var1_Be_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)  // Смещение по регистру с Востока -» на Юг .|  3 часа
           {
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            z_Sev_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 8";
            z_errorprint[32]=1;
             z_Var1_Be_1=2;
			 z_Var1_Be_0=0;
            //Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 9
         if(z_vost==1 && z_Var1_Bo_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            z_Zap_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Sev_1=1;
            z_Vost_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 9";
            z_errorprint[33]=1;
			z_Var1_Bo_0=2;
			z_Var1_Be_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 10
         if(z_vost==1 && z_Var1_Bo_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true) // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            z_Zap_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Sev_1=1;
            z_Vost_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 10";
            z_errorprint[34]=1;
			z_Var1_Bo_1=2;
			z_Var1_Be_0=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           
           }
         // 11
         if(z_vost==1 && z_Var1_Be_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            z_Zap_1=0;
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 направлений
            z_Sev_1=0;
            z_Yug_1=1;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 11";
            z_errorprint[35]=1;
            z_Var1_Be_0=2;
			z_Var1_Bo_1=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 12
         if(z_vost==1 && z_Var1_Be_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  // Смещение по регистру с Востока -» на Запад «- 6 часов
           {
            z_Zap_1=0;
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 направлений
            z_Sev_1=0;
            z_Yug_1=1;
            
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="V 12";
            z_errorprint[36]=1;
            z_Var1_Be_1=2;
		    z_Var1_Bo_0=0;
			//Смена Оси для правил Z
			z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         //__________________________________
         // Правильная конфигурация Юг
         // 1
         if(z_yug==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)
           {
            z_Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Sev_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 1";
            z_errorprint[37]=1;

           }
         // 2
         if(z_yug==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1 && z_ChekDIr==true)
           {
            z_Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Sev_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 2";
            z_errorprint[38]=1;
           }
         // 3
         if(z_yug==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)
           {
            z_Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Sev_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 3";
            z_errorprint[39]=1;
           }
         // 4
         if(z_yug==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1 && z_ChekDIr==true)
           {
            z_Yug_1=1;// разрешение на обработку события.
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=0;
            z_Sev_1=0;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=1;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 4";
            z_errorprint[40]=1;
           }
         // 5
         // Не правильная конфигурация
         if(z_yug==1 && z_Var1_Be_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  //Смещение по регистру с Юга на .| на Восток -» 9 часов
           {
            // разрешение на обработку события.
            z_Zap_1=0;
            //Запрет для 3 направлений
            z_Vost_1=0;
            z_Sev_1=1;
            z_Yug_1=0;
          
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 5";
            z_errorprint[41]=1;
            z_Var1_Be_0=2;
		    z_Var1_Be_1=0;
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 6
         if(z_yug==1 && z_Var1_Bo_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  //Смещение по регистру с Юга на .| на Восток -» 9 часов
           {
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Sev_1=1;
            z_Yug_1=0;
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 6";
            z_errorprint[42]=1;
            z_Var1_Bo_1=2;
			z_Var1_Bo_0=0;
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 7
         if(z_yug==1 && z_Var1_Bo_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Юга на .| на  Запад «- 3 часа
           {
            // разрешение на обработку события.
            z_Vost_1=0;
            //Запрет для 3 нап равлений
            z_Sev_1=1;
            z_Zap_1=0;
            z_Yug_1=0;
            
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 7";
            z_errorprint[43]=1;
            z_Var1_Bo_0=2;
			z_Var1_Bo_1=0;
          z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 8
         if(z_yug==1 && z_Var1_Be_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true)  // Смещение по регистру с Юга на .| на Запад «- 3 часа
           {
            // разрешение на обработку события.
            z_Zap_1=0;
            //Запрет для 3 направлений
            z_Sev_1=1;
            z_Vost_1=0;
            z_Yug_1=0;
       
            //Проверка значения направления
            z_sev=1;
            z_zap=0;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 8";
            z_errorprint[44]=1;
           z_Var1_Be_1=2;
		   z_Var1_Be_0=0;
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 9
         if(z_yug==1 && z_Var1_Bo_0==0 && z_Var2_Bo_1==1 && z_ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            z_Sev_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;

            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Y 9";
            z_errorprint[45]=1;
			z_Var1_Bo_0=2;
			z_Var1_Be_1=0;
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
            
           }
         // 10
         if(z_yug==1 && z_Var1_Bo_1==0 && z_Var2_Bo_0==1 && z_ChekDIr==true) // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            z_Sev_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=0;
            z_Vost_1=1;
            //Проверка значения направления
            z_sev=0;
            z_zap=0;
            z_yug=0;
            z_vost=1;
            z_ChekDIr=false;
            z_BlockNum="Y 10";
            z_errorprint[46]=1;
            z_Var1_Bo_1=2;
			z_Var1_Be_0=0;
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
           }
         // 11
         if(z_yug==1 && z_Var1_Be_0==0 && z_Var2_Be_1==1 && z_ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            z_Sev_1=0;
            // разрешение на обработку события.
            z_Yug_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;

           //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 11";
            z_errorprint[47]=1;
			z_Var1_Be_0=2;
			z_Var1_Bo_1=0;
          z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
          
           }
         // 12
         if(z_yug==1 && z_Var1_Be_1==0 && z_Var2_Be_0==1 && z_ChekDIr==true)  // Смещение по регистру с Юга на .| на Север *| 6 часов
           {
            // разрешение на обработку события.
            z_Sev_1=0;
            //Запрет для 3 направлений
            z_Zap_1=1;
            z_Vost_1=0;
            z_Yug_1=0;
         
            //Проверка значения направления
            z_sev=0;
            z_zap=1;
            z_yug=0;
            z_vost=0;
            z_ChekDIr=false;
            z_BlockNum="Y 12";
            z_errorprint[48]=1;
			z_Var1_Be_1=2;
			z_Var1_Bo_0=0;
			
            z_CheFe=1;
            if(z_CheFe==1 && z_lic==1)
              {
               z_izn=1;
               z_lic=0;
               z_CheFe=0;
              }
            if(z_CheFe==1 && z_izn==1)
              {
               z_izn=0;
               z_lic=1;
               z_CheFe=0;
              }
			
           
           }

         //Проверка шаг 3
         string z_napravlenie;
         if(z_Sev_1==1)
           {
            z_napravlenie="z_Sev_1";
           }
         if(z_Yug_1==1)
           {
            z_napravlenie="z_Yug_1";
           }
         if(z_Zap_1==1)
           {
            z_napravlenie="z_Zap_1";
           }
         if(z_Vost_1==1)
           {
            z_napravlenie="z_Vost_1";
           }
         //Print(napravlenie);
         // 4 направления в которых вложены 2 стороны и 8 регистров. В сумме 768 регистров
         // ечать ошибок блока разрешений для индикатора Семечка
         //for(int gh=1;gh<49;gh++)
         //{
         //Print("index ",gh);
         //Print("errorprint ",errorprint[gh]);

         ArrayInitialize(z_errorprint2,0);
         //}
         //Поведение северной стороны
         if(z_Sev_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(z_lic==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,2]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[1]=1;//Proverka zapuska bloka
                 }
               if(z_Sev[1,2]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[2]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,6]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[3]=1;
                 }
               if(z_Sev[1,6]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[4]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(z_lic==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,1]==0 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[5]=1;
                 }
               if(z_Sev[1,1]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[6]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,5]==0 && z_Var2_Be_0==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[6]=1;
                 }
               if(z_Sev[1,5]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[7]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(z_lic==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,4]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[8]=1;
                 }
               if(z_Sev[1,4]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[9]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,8]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[10]=1;
                 }
               if(z_Sev[1,8]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[11]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(z_lic==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,3]==0 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[12]=1;
                 }
               if(z_Sev[1,3]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[13]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,7]==0 && z_Var2_Be_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[14]=1;
                 }
               if(z_Sev[1,7]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[15]=1;
                 }
              }// izn==1 фин

            


           }// Sever фин
         //_____________________________________
         // Поведение Юг
         if(z_Yug_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(z_lic==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,4]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[32]=1;
                 }
               if(z_Sev[1,4]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[33]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,8]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[34]=1;
                 }
               if(z_Sev[1,8]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[35]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(z_lic==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,3]==0 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[36]=1;
                 }
               if(z_Sev[1,3]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[37]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,7]==0 && z_Var2_Be_0==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[38]=1;
                 }
               if(z_Sev[1,7]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[39]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(z_lic==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,2]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[40]=1;
                 }
               if(z_Sev[1,2]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[41]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,6]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[42]=1;
                 }
               if(z_Sev[1,6]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gx++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[43]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(z_lic==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,1]==0 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[44]=1;
                 }
               if(z_Sev[1,1]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[45]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,5]==0 && z_Var2_Be_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[46]=1;
                 }
               if(z_Sev[1,5]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gx--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[47]=1;
                 }
              }// izn==1 фин

            
           }// Yug фин
         //___________________________________
         // Поведение Запад
         if(z_Zap_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(z_lic==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,3]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[64]=1;
                 }
               if(z_Sev[1,3]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[65]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,5]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[66]=1;
                 }
               if(z_Sev[1,5]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[67]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(z_lic==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,2]==0 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[68]=1;
                 }
               if(z_Sev[1,2]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[69]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,8]==0 && z_Var2_Be_0==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[70]=1;
                 }
               if(z_Sev[1,8]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[71]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(z_lic==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,1]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[72]=1;
                 }
               if(z_Sev[1,1]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[73]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,7]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[74]=1;
                 }
               if(z_Sev[1,7]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[75]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(z_lic==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,4]==0 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=1;//ПРОВЕРИТъ Должно быть 1,4 Смена в регистре на противоположное значение на лице
                  z_Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[76]=1;
                 }
               if(z_Sev[1,4]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[77]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,6]==0 && z_Var2_Be_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=1;//Проверить 1,7 Смена в регистре на противоположное значение на лице
                  z_Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[78]=1;
                 }
               if(z_Sev[1,6]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 { 
                  z_Sev[1,4]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[79]=1;
                 }
              }// izn==1 фин

            


           }// Zapad фин

         //___________________________________
         // Поведение Восток
         if(z_Vost_1==1)
           {
            //Подача значения на Лицо номер 1
            //1 Be_0 && Bo_0
            if(z_lic==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,1]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,7]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[96]=1;
                 }
               if(z_Sev[1,1]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[97]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_0==0 && z_Var2_Bo_0==1) //Праверка регистра Bo_0 Изнанки
              {
               //1/1 Be_0 && Bo_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,7]==0 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,7]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,1]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[98]=1;
                 }
               if(z_Sev[1,7]==1 && z_Var2_Bo_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,1]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=0;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[99]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 2
            //1 Bo_0 && Be_0
            if(z_lic==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,4]==0 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,6]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[100]=1;
                 }
               if(z_Sev[1,4]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[101]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_0==0 && z_Var2_Be_0==1) //Праверка регистра Be_0 Изнанки
              {
               //1/1 Bo_0 && Be_0
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,6]==0 && z_Var2_Be_0==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,6]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,4]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[102]=1;
                 }
               if(z_Sev[1,6]==1 && z_Var2_Be_0==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,4]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=0;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[103]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 3
            //1 Be_1 && Bo_1
            if(z_lic==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,3]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,5]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[104]=1;
                 }
               if(z_Sev[1,3]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[105]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Be_1==0 && z_Var2_Bo_1==1) //Праверка регистра Bo_1 Изнанки
              {
               //1/1 Be_1 && Bo_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,5]==0 && z_Var2_Bo_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,5]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,3]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[106]=1;
                 }
               if(z_Sev[1,5]==1 && z_Var2_Bo_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,3]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=2;
                  z_Var1_Bo_1=0;
                  //----------
                  z_Gy++;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[107]=1;
                 }
              }// izn==1 фин

            //Подача значения на Лицо номер 4
            //1 Bo_1 && Be_1
            if(z_lic==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Лица
              {
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,2]==0 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,8]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[108]=1;
                 }
               if(z_Sev[1,2]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=0;
                  z_lic=0;//Смена Стороны
                  z_izn=1;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[109]=1;
                 }
              }// lic==1 фин
            if(z_izn==1 && z_Var1_Bo_1==0 && z_Var2_Be_1==1) //Праверка регистра Be_1 Изнанки
              {
               //1/1 Bo_1 && Be_1
               bool z_BlockPermis=true;
               // Сравнение состояния 2 регистров лица и изнанки по поданному значению
               if(z_Sev[1,8]==0 && z_Var2_Be_1==1 && z_BlockPermis==true)// Смена в регистре на противоположное значение и Смена Лица на Изнанку
                 {
                  z_Sev[1,8]=1;//Смена в регистре на противоположное значение на лице
                  z_Sev[1,2]=0;//Смена в регистре на противоположное значение на изнанке
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[110]=1;
                 }
               if(z_Sev[1,8]==1 && z_Var2_Be_1==1 && z_BlockPermis==true) // Смена в регистре не производитсяи Смена Лица на Изнанку
                 {
                  z_Sev[1,2]=0;
                  z_lic=1;//Смена Стороны
                  z_izn=0;//Смена Стороны
                  //Перераспределение разрешений переменных
                  z_Var1_Be_0=2;
                  z_Var1_Bo_0=2;
                  z_Var1_Be_1=0;
                  z_Var1_Bo_1=2;
                  //----------
                  z_Gy--;
                  z_Var2_Be_0=2;
                  z_Var2_Bo_0=2;
                  z_Var2_Be_1=2;
                  z_Var2_Bo_1=2;
                  z_BlockPermis=false;
                  z_errorprint2[111]=1;
                 }
              }// izn==1 фин

            

           }// Vostok фин
         //--Конец Вращение Оси Z
         
         
         //-----I write the received data into a Binary File for drawing data using the Histogram method
         int file_handle15=FileOpen(FileName15,FILE_READ|FILE_WRITE|FILE_BIN);
         if(file_handle15>0)
           {

            FileSeek(file_handle15,0,SEEK_CUR);

            FileWriteArray(file_handle15,PIPS_COL_DT,0,WHOLE_ARRAY);
            FileClose(file_handle15);

           }
         int file_handle16=FileOpen(FileName16,FILE_READ|FILE_WRITE|FILE_BIN);
         if(file_handle16>0)
           {

            FileSeek(file_handle16,0,SEEK_CUR);

            FileWriteArray(file_handle16,PIPS_COL_Price,0,WHOLE_ARRAY);
            FileClose(file_handle16);

           }

         // ------ Printing Collected Values ​​to File ------
         if(bodypips[MaxInd_bodypips,0]>price_Menus_one && (bodypips[MaxInd_bodypips,0]>price_plus ||bodypips[MaxInd_bodypips,0]<price_plus))
           {
            int file_handle14=FileOpen(FileName14,FILE_READ|FILE_WRITE," ");
            if(file_handle14>0)
              {


               FileSeek(file_handle14,0,SEEK_END);
               FileWrite(file_handle14,Symbol()," T ",iTime(Symbol(),0,1),/*" Var1Wr ",Var1Wr," B 3 ",Bo," Dir ",napravlenie,/*"Face",face,*//*" BlockNum ",BlockNum,*/" Fly X ",Sev[1,1],Sev[1,2],Sev[1,3],Sev[1,4],Sev[1,5],Sev[1,6],Sev[1,7],Sev[1,8]," PR ",bodypips[MaxInd_bodypips,0]," Fly Z ",z_Sev[1,1],z_Sev[1,2],z_Sev[1,3],z_Sev[1,4],z_Sev[1,5],z_Sev[1,6],z_Sev[1,7],z_Sev[1,8], " X ",Gx," Y ",Gy/*" I CONT ",bodypips[MaxInd_bodypips,1]," O ",Onda1/*" ERR2 ", Sterr2*/);
               FileClose(file_handle14);

              }
           }
         if(bodypips[MaxInd_bodypips,0]<price_Menus_one && (bodypips[MaxInd_bodypips,0]>price_minus || bodypips[MaxInd_bodypips,0]<price_minus))
           {
            int file_handle14=FileOpen(FileName14,FILE_READ|FILE_WRITE," ");
            if(file_handle14>0)
              {


               FileSeek(file_handle14,0,SEEK_END);
               FileWrite(file_handle14,Symbol()," T ",iTime(Symbol(),0,1),/*" Var1Wr ",Var1Wr," B 3 ",Be,/*"Face",face,*//*" Dir ",napravlenie,/*" BlockNum ",BlockNum,*/" Fly X ",Sev[1,1],Sev[1,2],Sev[1,3],Sev[1,4],Sev[1,5],Sev[1,6],Sev[1,7],Sev[1,8]," PR ",bodypips[MaxInd_bodypips,0]," Fly Z ",z_Sev[1,1],z_Sev[1,2],z_Sev[1,3],z_Sev[1,4],z_Sev[1,5],z_Sev[1,6],z_Sev[1,7],z_Sev[1,8], " X ",Gx," Y ",Gy/*" I CONT ",bodypips[MaxInd_bodypips,1]," O ",Onda1/*" ERR2 ", Sterr2*/);
               FileClose(file_handle14);

              }
           }
        }
      Print(" PR ",bodypips[MaxInd_bodypips,0]);

      Comment(" Fly X ",Sev[1,1],Sev[1,2],Sev[1,3],Sev[1,4],Sev[1,5],Sev[1,6],Sev[1,7],Sev[1,8], " PR ",bodypips[MaxInd_bodypips,0] ," Fly Z ",z_Sev[1,1],z_Sev[1,2],z_Sev[1,3],z_Sev[1,4],z_Sev[1,5],z_Sev[1,6],z_Sev[1,7],z_Sev[1,8]);

      //---Были определены синапсные связи которые могут показывать на смену тенденции---//
      //---Тип 1 Bo_0/Bo_1
      //---Тип 2 Be_0/Be_1
      //---Было выявленно чо нужно обратить внимание на цену каждого типа и индекс контейнера.



      //Print(" IFb1 ",IFb1);
      //if(IFb1==1441)//Запись данных в Массив и обнуление первичьного массива один раз в сутки
      // {
      //-----
      //bintoarrTIME[IFb1]=iTime(Symbol(),0,1);//Пишу время предыдущей анализируемой свечи в массив
      //Print( bintoarrTIME[IFb1]);
      //-----
      //int i;
      //---загружаю в 2 массива данные о Бинарном коде, Времени и Цене
      //int file_handle8=FileOpen(FileName8,FILE_READ|FILE_BIN);
      //Print(" file_handle8 ",file_handle8);//Monitoring
      //if(file_handle8>0)
      //{

      //FileSeek(file_handle8,0,SEEK_CUR);
      //FileReadArray(file_handle8,BinaryToArray,0,WHOLE_ARRAY);//загрузка данных из файла в массив данных
      //FileClose(file_handle8);

      //}
      //---Загрузка в массив базы данных о повторах бинарных ключей
      //int file_handle11=FileOpen(FileName11,FILE_READ|FILE_BIN);
      //Print(" file_handle8 ",file_handle8);//Monitoring
      //if(file_handle11>0)
      //{

      //FileSeek(file_handle11,0,SEEK_CUR);
      //FileReadArray(file_handle11,binrepit,0,WHOLE_ARRAY);//данны о полученых повторах.С
      //FileClose(file_handle11);

      //}
      //int file_handle9=FileOpen(FileName9,FILE_READ|FILE_BIN);
      //if(file_handle9>0)
      //{

      // FileSeek(file_handle9,0,SEEK_CUR);
      // FileReadArray(file_handle9,BinaryToArrayBID,0,WHOLE_ARRAY);
      // FileClose(file_handle9);

      //}
      // int file_handle10=FileOpen(FileName10,FILE_READ|FILE_BIN);
      //if(file_handle10>0)
      // {

      //FileSeek(file_handle10,0,SEEK_CUR);
      //FileReadArray(file_handle10,BinaryToArrayTIME,0,WHOLE_ARRAY);
      //FileClose(file_handle10);

      //}


      //-------------------
      //for(i=1; i<32000; i++) //Получение индекса в заполненом массива
      //{
      //if(BinaryToArray[i,0]==10)
      // {
      // break;

      //}
      // }
      //Print("index ",i);
      //--Перед записью в файлы нужно фильтрую на дубли с переносом во временный массив
      //int ia=0;//индекс для перебора массива
      //int ib=0;//индекс для перебора массива
      //int ic=0;//индекс для перебора массива
      //int id=0;//индекс для перебора массива
      //int iei=0;
      //int ie=1;
      //for(ia=1; ia<20/*1442*/; ia++) //Получение индекса в заполненом массива
      //{
      //Print("щёт ia ",ia);
      // for(ib=1; ib<20/*32001*/; ib++) //Получение индекса в заполненом массива
      // {
      //Print("щёт ib ",ib);
      // for(ic=0; ic<20/*1002*/; ic++) //Получение индекса в заполненом массива
      //  {
      // Print("щёт ia ",ia,"щёт ib ",ib,"щёт ic ",ic);
      //Print(" BinaryToArray[ib,ic] ",BinaryToArray[ib,ic]," bintoarr[ia,ic] ",bintoarr[ia,ic]," bintoarr[1,0] ",bintoarr[1,0]," bintoarr[1,1] ",bintoarr[1,1]," bintoarr[2,0] ",bintoarr[2,0]," bintoarr[2,1] ",bintoarr[2,1]);
      //if(BinaryToArray[ib,ic]!=bintoarr[ia,ic])//Ищу не равенство в строке.Если хоть один элемент не равен то щитать как новая запись
      //{
      //-----Писать во временный фаил отфильтрованные сигналы с дальнейшей дозаписью
      //Переносить во времменный массив все параметры
      //  for(id=0; id<20/*1002*/; id++)
      //  {
      // permis=1;
      // iei=ie;
      //temparrbin[ie,id]=bintoarr[ia,id];//Присваиваю во временный массив не повторение полученное в результате отсева
      //temparrbid[ie,id]=bintoarrBID[ia,id];//цена
      //temparrtime[ie]=bintoarrTIME[ia];//
      // Print(" temparrbin[ie,id] ",temparrbin[ie,id]);
      //Print(" temparrbid[ie,id] ",temparrbid[ie,id]);
      // Print(" temparrtime[ie] ",temparrtime[ie]);
      //Print(" ie ",ie," id ",id);
      // Print("щёт ie ",ie,"щёт id ",id);
      // }
      //ie++;//Увеличиваю номер строки на 1
      //---Ошибкав доступе в массив
      //if(ie>1441)//Если ие 1442 то прервать функцию
      //{
      // Print(" ie ",ie," Break ");
      // break;

      //  }
      // Print(" ie ",ie);//
      //}
      //if(permis==1)
      // {
      //  break;
      // }

      //break;
      //if(iei<ie)
      //{
      //break;
      //}
      //----Вписать сравнение на совместимость. Если совмещается сигнал то писать только время открытия свечи в массив.
      //}

      //}

      //}

      //file_handle8=FileOpen(FileName8,FILE_READ|FILE_WRITE|FILE_BIN);
      //Print(" file_handle8 ",file_handle8);
      //if(file_handle8>0)
      // {

      // FileSeek(file_handle8,0,SEEK_CUR);

      // FileWriteArray(file_handle8,temparrbin,i,WHOLE_ARRAY);
      // FileClose(file_handle8);

      // }
      //int file_handle9=FileOpen(FileName9,FILE_READ|FILE_WRITE|FILE_BIN);
      // if(file_handle9>0)
      // {

      // FileSeek(file_handle9,0,SEEK_CUR);

      //FileWriteArray(file_handle9,temparrbid,i,WHOLE_ARRAY);
      //FileClose(file_handle9);

      // }

      // int file_handle10=FileOpen(FileName10,FILE_READ|FILE_WRITE|FILE_BIN);
      //if(file_handle10>0)
      //{

      // FileSeek(file_handle10,0,SEEK_CUR);

      //FileWriteArray(file_handle10,temparrtime,i,WHOLE_ARRAY);
      //FileClose(file_handle10);

      // }
      //---Провожу запись в базу данных отобранных повторов - в базу нужно писать как время новых ключей так и время повторений
      //------------------------------------

      //ArrayInitialize(bintoarr,10);//Перезагрузка массива после отгрузки в базу
      //ArrayInitialize(temparrbin,10);
      //ArrayInitialize(temparrbid,10);
      //ArrayInitialize(temparrtime,10);
      //ArrayInitialize(bintoarrBID,10);
      //ArrayInitialize(bintoarrTIME,10);


      //IFb1=0;//Индекс строки устанавливаю на 1
      //IFb2=0;//Начинаю писать в строке с 0 позиции
      //}

      //if(IFb1<1441)
      // {
      //  bintoarrTIME[IFb1]=iTime(Symbol(),0,1);//Пишу время предыдущей анализируемой свечи в массив
      //  IFb1++;//Увеличивание значения строки в массиве при наступлении нового бара.Запись будетпроизводится в следующую строку
      // IFb2=0;//Начинаю писать в строке с 0 позиции
      // }
      //Print(" IFb1 ",IFb1," IFb2 ", IFb2);//Мониторинг индексов массива
      //---------------------

      if(GetLastError()==4002)

        {
         Alert(" EA ERROR- RELOAD");
         ResetLastError();
        }

      im=im++;
      //Compensation price calculation function
      int ikz;
      for(ikz=1; ikz<99999; ikz++)
        {
         if(body[ikz,1]==10)
           {
            break;
           }
        }
      int Counter_Summa1_AR=0;
      int Counter_Summa0_AR=0;
      for(int ik=1; ik<ikz; ik++)
        {
         if(body[ik,1]==1)
           {
            Counter_Summa1_AR++;
           }

        }
      for(int il=1; il<ikz; il++)
        {
         if(body[il,1]==0)
           {
            Counter_Summa0_AR++;
           }

        }

      one_BE=Counter_Summa1_AR;//Power of bears
      int zero_BE=Counter_Summa0_AR;//Power of Bull
      Rez_BE=one_BE-zero_BE;
      // ----- Calculation of Fibonacci levels -----
      RefreshRates();
      datetime IreceiveBarTime=iTime(Symbol(),0,1);
      bartimeresult=IreceiveBarTime;
      IreceiveLevelresult=one_BE;

      HIGHT=iHigh(Symbol(),0,1);
      LOW=iLow(Symbol(),0,1);
      CLOSE=iClose(Symbol(),0,1);
      OPEN=iOpen(Symbol(),0,1);
      normalLevel=IreceiveLevelresult*Point;
      center=NormalizeDouble(HIGHT-((HIGHT-LOW)/2),NormalizaDigi);

      DoublspredPoint=spredpoints*Point();
      LEVELUP=NormalizeDouble((center+normalLevel),NormalizaDigi);//1
      LEVELDOWN=NormalizeDouble((center-normalLevel),NormalizaDigi);//1

      IpaintFiboLineUP_2=NormalizeDouble((LEVELUP+(normalLevel*2)),NormalizaDigi);
      IpaintFiboLineUP_3=NormalizeDouble((IpaintFiboLineUP_2+(normalLevel*3)),NormalizaDigi);
      IpaintFiboLineUP_5=NormalizeDouble((IpaintFiboLineUP_3+(normalLevel*5)),NormalizaDigi);
      IpaintFiboLineUP_8=NormalizeDouble((IpaintFiboLineUP_5+(normalLevel*8)),NormalizaDigi);
      IpaintFiboLineUP_13=NormalizeDouble((IpaintFiboLineUP_8+(normalLevel*13)),NormalizaDigi);
      IpaintFiboLineUP_21=NormalizeDouble((IpaintFiboLineUP_13+(normalLevel*21)),NormalizaDigi);
      IpaintFiboLineUP_34=NormalizeDouble((IpaintFiboLineUP_21+(normalLevel*34)),NormalizaDigi);
      IpaintFiboLineUP_55=NormalizeDouble((IpaintFiboLineUP_34+(normalLevel*55)),NormalizaDigi);
      IpaintFiboLineUP_89=NormalizeDouble((IpaintFiboLineUP_55+(normalLevel*89)),NormalizaDigi);
      IpaintFiboLineUP_144=NormalizeDouble((IpaintFiboLineUP_89+(normalLevel*144)),NormalizaDigi);

      IpaintFiboLineDOWN_2=NormalizeDouble((LEVELDOWN-(normalLevel*2)),NormalizaDigi);
      IpaintFiboLineDOWN_3=NormalizeDouble((IpaintFiboLineDOWN_2-(normalLevel*3)),NormalizaDigi);
      IpaintFiboLineDOWN_5=NormalizeDouble((IpaintFiboLineDOWN_3-(normalLevel*5)),NormalizaDigi);
      IpaintFiboLineDOWN_8=NormalizeDouble((IpaintFiboLineDOWN_5-(normalLevel*8)),NormalizaDigi);
      IpaintFiboLineDOWN_13=NormalizeDouble((IpaintFiboLineDOWN_8-(normalLevel*13)),NormalizaDigi);
      IpaintFiboLineDOWN_21=NormalizeDouble((IpaintFiboLineDOWN_13-(normalLevel*21)),NormalizaDigi);
      IpaintFiboLineDOWN_34=NormalizeDouble((IpaintFiboLineDOWN_21-(normalLevel*34)),NormalizaDigi);
      IpaintFiboLineDOWN_55=NormalizeDouble((IpaintFiboLineDOWN_34-(normalLevel*55)),NormalizaDigi);
      IpaintFiboLineDOWN_89=NormalizeDouble((IpaintFiboLineDOWN_55-(normalLevel*89)),NormalizaDigi);
      IpaintFiboLineDOWN_144=NormalizeDouble((IpaintFiboLineDOWN_89-(normalLevel*144)),NormalizaDigi);
      // ---END-- Calculation of Fibonacci levels -----


      k=0;
      ArrayInitialize(MaxMinArr,0);
      // ----- Calculation of  Maximum , Minimum INDICARTOR
      int inf;
      int ic;
      for(ic=1; ic<99999; ic++)
        {
         if(body[ic,0]==10)
           {
            break;
           }
        }
      inf=ic-1;

      int b1=(int)body[1,1];
      if(b1==1)
        {
         k=1;
        };
      if(b1==0)
        {
         k=0;
        };
      MaxMinArr[1]=k;

      //-----------------------------
      int ina;
      for(ina=2; ina<=inf; ina++)
        {

         if(body[ina,1]==1)
           {
            k++;
           };
         if(body[ina,1]==0)
           {
            k--;
           };
         MaxMinArr[ina]=k;

        }

      //--Maximum - minimum INDEX ARRAY
      IndexMaximum=ArrayMaximum(MaxMinArr,WHOLE_ARRAY,0);
      IndexMinimum=ArrayMinimum(MaxMinArr,WHOLE_ARRAY,0);
      //--------Max Min Numbers
      Maximum=MathAbs(MaxMinArr[IndexMaximum]);//bool
      Minimum=MathAbs(MaxMinArr[IndexMinimum]);//bear

      // ---END Calculation of  Maximum , Minimum INDICARTOR

      // --- The last digit indicates the type of resistance that formed inside the candle --- //
      int LasData=MaxMinArr[inf];// Used for the divergence indicator


      // -----Synapsys Indicator-----


      ArrayInitialize(komp1,0);
      ArrayInitialize(kompa,10);

      //---------------------------------------------
      int inr;
      for(inr=1; inr<99999; inr++)
        {
         if(body[inr,0]==10)
           {

            break;

           }

        }


      int inr1=inr-1;

      for(int inb=1; inb<inr1; inb++)
        {
         if(body[inb,0]>0  &&  body[inb+1,0]>0)
           {
            if(body[inb,0]==body[inb+1,0])
              {
               if((body[inb,1]==1 && body[inb+1,1]==0) || (body[inb,1]==0 && body[inb+1,1]==1))
                 {
                  komp1[inb]=body[inb,0];
                  kompa[inb]=body[inb,0];
                 }
              }
           }
         if(body[inb,0]>0 && body[inb+1,0]==0)
           {
            if(body[inb,0]==body[inb+1,3])
              {
               if((body[inb,1]==1 && body[inb+1,1]==0) || (body[inb,1]==0 && body[inb+1,1]==1))
                 {
                  komp1[inb]=body[inb,0];
                  kompa[inb]= body[inb,0];
                 }
              }
           }
         if(body[inb,0]==0 && body[inb+1,0]>0)
           {
            if(body[inb,3]==body[inb+1,0])
              {
               if((body[inb,1]==1 && body[inb+1,1]==0) || (body[inb,1]==0 && body[inb+1,1]==1))
                 {
                  komp1[inb]=body[inb,0];
                  kompa[inb]= body[inb,0];
                 }
              }
           }
        }


      int MinPriceSintezINDEX=ArrayMinimum(kompa,WHOLE_ARRAY,0);
      double MinPriceSintez=(kompa[MinPriceSintezINDEX]);

      //---------------------------------------

      int MaxPriceSintezINDEX=ArrayMaximum(kompa,WHOLE_ARRAY,0);
      double MaxPriceSintez=(kompa[MaxPriceSintezINDEX]);

      int file_handle17=FileOpen(FileName17,FILE_READ|FILE_WRITE," ");
      if(file_handle17>0)
        {

         FileSeek(file_handle17,0,SEEK_END);

         FileWrite(file_handle17,Symbol()," MinPriceSintezINDEX ",MinPriceSintezINDEX," MaxPriceSintezINDEX ",MaxPriceSintezINDEX);
         FileClose(file_handle17);
        }
      // ---END--Synapsys Indicator-----


      //-------Arrays------

      ArrayInitialize(ArrayMaximum_0,0);
      ArrayInitialize(ArrayMaximum_1,0);
      //---------------Contador  de ARRAY Identificacion de Index. Se identifica fin de relleno de datos
      int i;
      for(i=1; i<99999; i++)
        {
         if(body[i,0]==10)
           {
            //Print(i);//index maximum donde acava array hay que restar 1 para saber ultimo dato
            break;
           }

        }
      //--------------

      int If=i-1;

      //-------------------------------------
      int count_1=1;
      int count_0=1;
      int in1;//Index
      int ArM1=1;
      int ArM0=1;
      int Permis=1;
      //Print(If);

      for(in1=1; in1<If; in1++)
        {

         if(Permis==1)
           {
            if(body[in1,1]==body[in1+1,1] && body[in1,1]==1 && body[in1+1,1]==1)
              {
               count_1++;

              }

            if(body[in1,1]!=body[in1+1,1])
              {

               ArrayMaximum_1[ArM1]=count_1;//4
               ArM1++;

               Permis=0;

               in1++;
               count_1=1;

              }
           }

         if(Permis==0)
           {

            if(body[in1,1]==body[in1+1,1] && body[in1,1]==0 && body[in1+1,1]==0)
              {
               count_0++;
              }
            if(body[in1,1]!=body[in1+1,1])
              {
               ArrayMaximum_0[ArM0]=count_0;
               ArM0++;
               Permis=1;
               count_0=1;

              }

           }


        }

      MaxBinNumber_1Index=ArrayMaximum(ArrayMaximum_1,WHOLE_ARRAY,0);
      MaxBinNumber_0Index=ArrayMaximum(ArrayMaximum_0,WHOLE_ARRAY,0);

      MaxBinNumber_1=(ArrayMaximum_1[MaxBinNumber_1Index]);
      MaxBinNumber_0=(ArrayMaximum_0[MaxBinNumber_0Index]);

      // ----- Compensation indicator-----
      int compensation_1,compensation_2;
      compensation_1=MaxMinArr[IndexMaximum]-MaxBinNumber_1;
      compensation_2=MaxMinArr[IndexMinimum]+MaxBinNumber_0;
      // --------- Test of received values ​​--------

      //Print(" TIME ",iTime(Symbol(),0,1));
      //Print(" Counter_Summa0 ",Counter_Summa0," Counter_Summa1 ",Counter_Summa1);//OK
      //Print(" IndexMaximum ",IndexMaximum," IndexMinimum ",IndexMinimum);//
      //Print(" Maximum ",Maximum," Minimum ",Minimum);
      //Print(" zeroindex ",zeroindex);
      //Print(" MinPriceSintezINDEX ",MinPriceSintezINDEX," MaxPriceSintezINDEX ",MaxPriceSintezINDEX);
      //Print(" Sw_On ",Sw_On);
      //Print(" MaxBinNumber_1 ",MaxBinNumber_1," MaxBinNumber_0 ",MaxBinNumber_0);
      //Print(" compensation_1 ",MaxMinArr[IndexMaximum]-MaxBinNumber_1," compensation_2 ",MaxMinArr[IndexMinimum]+MaxBinNumber_0);
      //Print("Bo ",Bo," Be ",Be);
      //Print("LasData ",LasData);
      //------resepcion de indice del 0


      for(i=1; i<99999; i++)
        {
         if(MaxMinArr[i]==0)
           {
            zeroindex=i;
            break;
           }
        }

      file_handle17=FileOpen(FileName17,FILE_READ|FILE_WRITE," ");
      if(file_handle17>0)
        {

         FileSeek(file_handle17,0,SEEK_END);

         FileWrite(file_handle17,Symbol()," zeroindex ",zeroindex);
         FileClose(file_handle17);
        }

      // ------------- Signal processing with classification and writing to the bbb_compare array ----------------- //
      if(Rez_BE==0)
        {
         int ibbb;
         for(ibbb=1; ibbb<1681; ibbb++)
           {

            if(one_BE>15 && bbb[ibbb,0]==Maximum-MaxBinNumber_1 && bbb[ibbb,1]==MaxMinArr[IndexMinimum]+MaxBinNumber_0)
              {

               int ibb;

               for(ibb=1; ibb<9999; ibb++)
                 {
                  if(bbb_compare[ibb,0,ibbb]==0)
                    {

                     bbb_compare[ibb,0,ibbb]=iarw;
                     int SignalCuant=bbb_compare[1,1,ibbb];
                     SignalCuant++;

                     bbb_compare[1,1,ibbb]=SignalCuant;

                     int file_handle13=FileOpen(FileName13,FILE_READ|FILE_WRITE|FILE_BIN);
                     //Print("HANDLE ",file_handle13);
                     if(file_handle13>0)
                       {

                        FileSeek(file_handle13,0,SEEK_CUR);

                        uint test =FileWriteArray(file_handle13,bbb_compare,0,WHOLE_ARRAY);
                        //Print("WRITED ",test);
                        FileClose(file_handle13);


                       }
                     break;
                    }



                 }
              }
           }
        }


      //-----------------------------------

      if(body[zeroindex,0]>0 && body[zeroindex,0]<2)
        {
         PriceZero=body[zeroindex,0];//Цена первого 0
        }
      else
         PriceZero=body[zeroindex,3];
      //-----брос переменных и массива
      Counter1=0;      //obnulyaem peremennye
      Counter1_1     = 0;
      Counter0       = 0;
      Counter0_1     = 0;
      Counter_Summa1 = 0;
      Counter_Summa0 = 0;
      Counter=0;

      ArrayInitialize(body,10);

      ///-----------------------------
      double operandopen=iOpen(Symbol(),PERIOD_M1,1);
      double operandclose=iClose(Symbol(),PERIOD_M1,1);

      //----------Индикатор сложения бинарного кода с ценой зеро-----------------
      if(Maximum!=0)
        {
         restantemaximum=NormalizeDouble(Maximum*Point,5);
         resOperandMax=operandopen-restantemaximum;

        }
      if(Minimum!=0)
        {
         restanteminimum=NormalizeDouble(Minimum*Point,5);
         resOperandMin=operandclose+restanteminimum;
        }



      if(resOperandMax==PriceZero && Maximum>0 && Minimum>0 && Rez_BE==0)
        {

         //TextVisualIndicator="SHORT";
         //Alert("SHORT");
         //string signalgroup=IntegerToString(zeroindex);
         //string Hora=TimeToString(iTime(Symbol(),0,1));
         //string levelnotificacion=DoubleToString(one_BE);
         //string message1=" TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion+" SHORT ";
         //SendNotification(message1);
         //TelegramSendText(apikey,chatid,message1);

         //SendNotification("SHORT");
         //SendNotification(Hora);
         //SendNotification(levelnotificacion);
         ONE_BE=(int)one_BE;
         file_handle4=FileOpen(FileName4,FILE_READ|FILE_WRITE," ");
         if(file_handle4>0)
           {

            FileSeek(file_handle4,0,SEEK_END);
            FileWrite(file_handle4," NEW SIGNAL ");
            FileWrite(file_handle4,"___________________________________________________________");
            FileWrite(file_handle4," SIMBOL |         TIME          | FONT | DIRECTION | PUSH |");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | "," SHORT "," | ",zeroindex," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileClose(file_handle4);
           }

        }

      //---LONG Posicion
      if(resOperandMin==PriceZero && Maximum>0 && Minimum>0 && Rez_BE==0)
        {
         //TextVisualIndicator="LONG";
         //Alert("LONG");
         //string signalgroup=IntegerToString(zeroindex);
         //string Hora1=TimeToString(iTime(Symbol(),0,1));
         //string levelnotificacion1=DoubleToString(one_BE);
         //string message2=" TIME "+Hora1+" SIGNAL NUMBER "+levelnotificacion1+" LONG "+signalgroup;
         //SendNotification(message2); //
         //TelegramSendText(apikey,chatid,message2);
         //SendNotification("LONG");
         //SendNotification(Hora);
         //SendNotification(levelnotificacion);

         file_handle4=FileOpen(FileName4,FILE_READ|FILE_WRITE," ");
         if(file_handle4>0)
           {

            FileSeek(file_handle4,0,SEEK_END);
            FileWrite(file_handle4," NEW SIGNAL ");
            FileWrite(file_handle4,"___________________________________________________________");
            FileWrite(file_handle4," SIMBOL |         TIME          | FONT | DIRECTION | PUSH |");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | "," LONG "," | ",zeroindex," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileClose(file_handle4);
           }

        }// Anadir excepcion de 10

      double Copen=iOpen(Symbol(),0,1);
      double Cclose=iClose(Symbol(),0,1);
      if(Copen>Cclose)
        {
         CopenRes=Copen-MaxPriceSintez;
         CcloseRes=MinPriceSintez-Cclose;
        }
      if(Copen<Cclose)
        {
         CopenRes=Cclose-MaxPriceSintez;
         CcloseRes=MinPriceSintez-Copen;
        }


      file_handle17=FileOpen(FileName17,FILE_READ|FILE_WRITE," ");
      if(file_handle17>0)
        {

         FileSeek(file_handle17,0,SEEK_END);

         FileWrite(file_handle17,Symbol()," MaxBinNumber_1 ",MaxBinNumber_1," MaxBinNumber_0 ",MaxBinNumber_0);
         FileClose(file_handle17);
        }



      //if(BinIndWRITE==true)
      //{
      // int ih;//index
      // for(ih=1; ih<99999; ih++)
      //  {
      //   if(body[ih,0]==10)
      //    {
      //    break;
      //   }

      //  }

      //  int iprint1=ih-1;//index

      // int iha;//index
      // for(iha=1; iha<10000; iha++)
      //  {
      //  if(ArrayMaximum_1[iha]==0)
      //   {
      //   break;
      //  }

      //  }
      //int iprint2a=iha-1;

      // int ihb;//index
      // for(ihb=1; ihb<10000; ihb++)
      //  {
      // if(ArrayMaximum_0[ihb]==0)
      // {
      //  break;
      // }

      //   }
      // int iprint3b=ihb-1;
      // for(int iprint=1; iprint<iprint1; iprint++)
      // {


      // Print("BODY ",body[iprint,1]);


      //   }
      //--------------------------------------

      //for(int iprint2=1; iprint2<iprint2a; iprint2++)
      // {


      //Print("ArrayMaximum_1 ",ArrayMaximum_1[iprint2]);


      //}
      //--------------------------------------

      //for(int iprint3=1; iprint3<iprint3b; iprint3++)
      // {


      //Print("ArrayMaximum_0 ",ArrayMaximum_0[iprint3]);


      //  }
      // }
      //---------------------

      if((resOperandMin==PriceZero || resOperandMax==PriceZero) && Maximum>0 && Minimum>0)
        {

         if(printdesc1==1)
           {

            ObjectSetString(0,Obiektcampo1,OBJPROP_TEXT,TimeToString(iTime(Symbol(),0,1)));
            ObjectSetString(0,Obiektcampo7,OBJPROP_TEXT,IntegerToString(one_BE,3));//Obiektcampo7 - 11
            ObjectSetString(0,Obiektcampo8,OBJPROP_TEXT,IntegerToString((int) Maximum,3));
            ObjectSetString(0,Obiektcampo9,OBJPROP_TEXT,IntegerToString((int) Minimum,3));
            ObjectSetString(0,Obiektcampo10,OBJPROP_TEXT,IntegerToString(MaxBinNumber_1,3));
            ObjectSetString(0,Obiektcampo11,OBJPROP_TEXT,IntegerToString(MaxBinNumber_0,3));
            ObjectSetString(0,Obiektcampo12,OBJPROP_TEXT,TextVisualIndicator);
            //printdesc1=0;
            //printdesc2=1;

            string priceZero=DoubleToStr(PriceZero,8);//Pole ceni zero
            ObjectDelete(Obiektcampo13);//Pole vivod Long ili Short
            ObjectCreate(Obiektcampo13,OBJ_BITMAP_LABEL,0,BrTime,HIGHT+0.00015);
            ObjectSetInteger(0,Obiektcampo13,OBJPROP_XDISTANCE,CHWPX-250);
            ObjectSetInteger(0,Obiektcampo13,OBJPROP_YDISTANCE,150);
            ObjectSetString(0,Obiektcampo13,OBJPROP_BMPFILE,priceZero);
            ObjectSetInteger(0,Obiektcampo13,OBJPROP_COLOR,clrRed);

            string pricemin=DoubleToStr(resOperandMin,8);//Pole ceni zero
            int PixMin=(int)(PriceZero-resOperandMin)*100000;
            ObjectDelete(Obiektcampo14);
            ObjectCreate(Obiektcampo14,OBJ_BITMAP_LABEL,0,BrTime,HIGHT+0.00015);
            ObjectSetInteger(0,Obiektcampo14,OBJPROP_XDISTANCE,CHWPX-230);
            ObjectSetInteger(0,Obiektcampo14,OBJPROP_YDISTANCE,150-PixMin);
            ObjectSetString(0,Obiektcampo14,OBJPROP_BMPFILE,pricemin);
            ObjectSetInteger(0,Obiektcampo14,OBJPROP_COLOR,clrGreen);

            string pricemax=DoubleToStr(resOperandMax,8);//Pole ceni zero
            int PixMax=(int)(resOperandMax-PriceZero)*100000;
            ObjectDelete(Obiektcampo15);//Pole cenizero
            ObjectCreate(Obiektcampo15,OBJ_BITMAP_LABEL,0,BrTime,HIGHT+0.00015);
            ObjectSetInteger(0,Obiektcampo15,OBJPROP_XDISTANCE,CHWPX-280);
            ObjectSetInteger(0,Obiektcampo15,OBJPROP_YDISTANCE,150-PixMax);
            ObjectSetString(0,Obiektcampo15,OBJPROP_BMPFILE,pricemax);
            ObjectSetInteger(0,Obiektcampo15,OBJPROP_COLOR,clrBlue);
            //operandopen
            //operandclose

           }

        }

      int Result_Compensation=compensation_1+compensation_2;

      int CompensationForGrafik=compensation_2*(-1);

      if((resOperandMin==PriceZero || resOperandMax==PriceZero) && Maximum>0 && Minimum>0 && Rez_BE==0)
        {
         file_handle4=FileOpen(FileName4,FILE_READ|FILE_WRITE," ");
         if(file_handle4>0)
           {
            // --- Direction change indicator -----
            // The indicator remembers the last change of direction based on the compensation indicator
            // If there is 0 in one or the other indicator, then the position in short or long changes


            string Text_Switch="No Data";
            Bool_Z=Maximum-MaxBinNumber_1;
            Bear_Z=MaxMinArr[IndexMinimum]+MaxBinNumber_0;
            //--------------------------------------------
            if(((Bool_Z>0 && Bear_Z==0)||(Bool_Z==0 && Bear_Z<0)) && Rez_BE==0 && one_BE>=1 && one_BE<=60)
              {
               Switch_L_S=1;// Position 1 means opening only long orders

              }
            if(((Bool_Z<0 && Bear_Z==0)||(Bool_Z==0 && Bear_Z>0)) && Rez_BE==0 && one_BE>=1 && one_BE<=60)
              {
               Switch_L_S=2;// Position 2 means opening only order shorts


              }
            if(Switch_L_S==1)
              {
               Text_Switch="Switch_L_S -- LONG";
              }
            if(Switch_L_S==2)
              {
               Text_Switch="Switch_L_S -- SHORT";
              }
            // --- function Record price in the Market Events Log
            // --- The prices of the UP5 / 8 i DOWSN5 / 8 levels are recorded
            double Price5ForWrite=0;
            double Price8ForWrite=0;
            if(Maximum-MaxBinNumber_1==0)
              {
               Price5ForWrite=IpaintFiboLineDOWN_5;
               Price8ForWrite=IpaintFiboLineDOWN_8;
              }
            if(MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
              {
               Price5ForWrite=IpaintFiboLineUP_5;
               Price8ForWrite=IpaintFiboLineUP_8;
              }

            BoolInd=NormalizeDouble((Maximum+MaxBinNumber_1)/(Minimum+MaxBinNumber_0),2);//Bool
            BearInd=NormalizeDouble((Minimum+MaxBinNumber_0)/(Maximum+MaxBinNumber_1),2);//Bear
            double SumaBoolBear=BoolInd+BearInd;
            // ----- record the index number in the database ----- //
            // load base from file into array
            int file_handle7=FileOpen(FileName7,FILE_READ|FILE_BIN);
            if(file_handle7>0)
              {

               FileSeek(file_handle7,0,SEEK_CUR);
               FileReadArray(file_handle7,bodyAR,0,WHOLE_ARRAY);
               FileClose(file_handle7);

              }

            for(iarw=1; iarw<100000; iarw++)
              {
               if(bodyAR[iarw,0]==61)
                 {
                  //Print(" indexIAR = ",iar);
                  break;
                 }
              }
            //---------------------------------------------//


            FileSeek(file_handle4,0,SEEK_END);
            FileWrite(file_handle4,"___________________________________________________________");
            FileWrite(file_handle4," SIMBOL |         TIME         | FONT |  BOOL-F  | BEAR-F |");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | ",Maximum-MaxBinNumber_1," | ",MaxMinArr[IndexMinimum]+MaxBinNumber_0," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4," ",Text_Switch);
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4," SIMBOL |         TIME         | FONT |  BOOL-N  | BEAR-N|");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | ",Maximum+MaxBinNumber_1," | ",Minimum+MaxBinNumber_0," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | ",BoolInd," | ",BearInd," | ",SumaBoolBear);
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,Symbol()," | ",iTime(Symbol(),0,1)," | ",ONE_BE," | ",Price5ForWrite," | ",Price8ForWrite," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileWrite(file_handle4,"| INDEX in DB | ",iarw," | ");
            FileWrite(file_handle4,"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯");
            FileClose(file_handle4);
           }

         LongShort=10;
         if(resOperandMin==PriceZero && Maximum>0 && Minimum>0 && one_BE>=1 && one_BE<=60 && Rez_BE==0)
           {
            TextVisualIndicator="LONG";
            Alert("LONG");
            string signalgroup=IntegerToString(zeroindex);
            string Hora1=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion1=IntegerToString(ONE_BE);
            string Comp1=IntegerToString(MaxMinArr[IndexMaximum]-MaxBinNumber_1);
            string Comp2=IntegerToString(MaxMinArr[IndexMinimum]+MaxBinNumber_0);
            string message2=SYmbol+" TIME "+Hora1+" SIGNAL NUMBER "+levelnotificacion1+" LONG "+" BOOL-F= "+Comp1+" BEAR-F= "+Comp2;
            SendNotification(message2); //
            LongShort=1;
           }

         if(resOperandMax==PriceZero && Maximum>0 && Minimum>0 && one_BE>=1 && one_BE<=60 && Rez_BE==0)
           {

            TextVisualIndicator="SHORT";
            Alert("SHORT");
            string signalgroup=IntegerToString(zeroindex);
            string Hora=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion=IntegerToString(ONE_BE);
            string Comp1=IntegerToString(MaxMinArr[IndexMaximum]-MaxBinNumber_1);
            string Comp2=IntegerToString(MaxMinArr[IndexMinimum]+MaxBinNumber_0);
            string message1=SYmbol+"-TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion+" SHORT "+" BOOL-F= "+Comp1+" BEAR-F= "+Comp2;
            SendNotification(message1);
            LongShort=0;
           }

         RefreshRates();


         if(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0 && Rez_BE==0)
           {
            LongPosition=true;
            ShortPosition=false;
           }
         if(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0 && Rez_BE==0)
           {
            ShortPosition=true;
            LongPosition=false;
           }
         //------------------------------------------------------------------------------
         if(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0 && Rez_BE==0)
           {
            ShortPosition=true;
            LongPosition=false;
           }
         if(one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0 && Rez_BE==0)
           {
            LongPosition=true;
            ShortPosition=false;
           }

         if(LongPosition==true && ((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {

            string  subject="From Tatiana - RootDiamond - LONG SIGNAL EURUSD";       // заголовок
            string messageLong="Open Long, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"/   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageLong);
            string Curency=Symbol();
            string Hora=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency +" LONG - FOR ROOTDIAMOND, TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;

            //TelegramSendText(apikey,chatid,message1);


           }
         if(ShortPosition==true && ((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {

            string  subject="From Tatiana - RootDiamond - SHORT SIGNAL EURUSD";       // заголовок
            string messageShort=" Open Short, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"/   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageShort);

            string Hora=TimeToString(iTime(Symbol(),0,1));
            string Curency=Symbol();
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency + " SHORT - FOR ROOTDIAMOND, TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;

            //TelegramSendText(apikey,chatid,message1);

           }


         if(((one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {

            string  subject="From Tatiana - RootDiamond_8 - SHORT SIGNAL EURUSD";       // заголовок
            string messageShort=" Open Short, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageShort);

            string Curency=Symbol();
            string Hora=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency+" SHORT - FOR ROOTDIAMOND_8 , TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;

            //int testT=TelegramSendText(apikey,chatid,message1);


           }
         if(((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {

            string  subject="From Tatiana - RootDiamond_8 - LONG SIGNAL EURUSD";
            string messageLong="Open Long, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" LEVEL "+IntegerToString(one_BE,0,0)+"   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageLong);

            string Hora=TimeToString(iTime(Symbol(),0,1));
            string Curency=Symbol();
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency+" LONG - FOR ROOTDIAMOND_8 , TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;


           }



         if(one_BE>0 && Rez_BE==0)
           {
            int file_handle6=FileOpen(FileName6,FILE_READ|FILE_BIN);
            if(file_handle6>0)
              {

               FileSeek(file_handle6,0,SEEK_CUR);
               FileReadArray(file_handle6,bodydt,0,WHOLE_ARRAY);
               FileClose(file_handle6);
              }

            int file_handle7=FileOpen(FileName7,FILE_READ|FILE_BIN);
            if(file_handle7>0)
              {

               FileSeek(file_handle7,0,SEEK_CUR);
               FileReadArray(file_handle7,bodyAR,0,WHOLE_ARRAY);
               FileClose(file_handle7);

              }
            //----------------------------------------------
            int iar=1;
            for(iar=1; iar<100000; iar++)
              {
               if(bodyAR[iar,0]==61)
                 {
                  //Print(" indexIAR = ",iar);
                  break;
                 }
              }



            RefreshRates();
            IreceiveBarTime=iTime(Symbol(),0,1);
            bartimeresult=IreceiveBarTime;
            IreceiveLevelresult=one_BE;

            HIGHT=iHigh(Symbol(),0,1);
            LOW=iLow(Symbol(),0,1);
            CLOSE=iClose(Symbol(),0,1);
            OPEN=iOpen(Symbol(),0,1);
            normalLevel=IreceiveLevelresult*Point;
            center=NormalizeDouble(HIGHT-((HIGHT-LOW)/2),NormalizaDigi);
            //---Lines calculation------
            DoublspredPoint=spredpoints*Point();
            LEVELUP=NormalizeDouble((center+normalLevel),NormalizaDigi);//1
            LEVELDOWN=NormalizeDouble((center-normalLevel),NormalizaDigi);//1
            //--------niveles de caracol
            bodydt[iar]=bartimeresult;
            bodyAR[iar,0]=IreceiveLevelresult;

            bodyAR[iar,1]=LEVELUP;
            bodyAR[iar,2]=IpaintFiboLineUP_2;
            bodyAR[iar,3]=IpaintFiboLineUP_3;
            bodyAR[iar,4]=IpaintFiboLineUP_5;
            bodyAR[iar,5]=IpaintFiboLineUP_8;
            bodyAR[iar,6]=IpaintFiboLineUP_13;
            bodyAR[iar,7]=IpaintFiboLineUP_21;
            bodyAR[iar,8]=IpaintFiboLineUP_34;
            bodyAR[iar,9]=IpaintFiboLineUP_55;
            bodyAR[iar,10]=IpaintFiboLineUP_89;
            bodyAR[iar,11]=IpaintFiboLineUP_144;

            bodyAR[iar,12]=LEVELDOWN;
            bodyAR[iar,13]=IpaintFiboLineDOWN_2;
            bodyAR[iar,14]=IpaintFiboLineDOWN_3;
            bodyAR[iar,15]=IpaintFiboLineDOWN_5;
            bodyAR[iar,16]=IpaintFiboLineDOWN_8;
            bodyAR[iar,17]=IpaintFiboLineDOWN_13;
            bodyAR[iar,18]=IpaintFiboLineDOWN_21;
            bodyAR[iar,20]=IpaintFiboLineDOWN_34;
            bodyAR[iar,21]=IpaintFiboLineDOWN_55;
            bodyAR[iar,22]=IpaintFiboLineDOWN_89;
            bodyAR[iar,23]=IpaintFiboLineDOWN_144;
            //--------сигналы------------
            bodyAR[iar,24]=Maximum-MaxBinNumber_1;
            bodyAR[iar,25]=MaxMinArr[IndexMinimum]+MaxBinNumber_0;
            bodyAR[iar,26]=Maximum+MaxBinNumber_1;
            bodyAR[iar,27]=Minimum+MaxBinNumber_0;
            bodyAR[iar,28]=BoolInd;
            bodyAR[iar,29]=BearInd;
            //--------Лонг Шорт-----------
            bodyAR[iar,30]=LongShort;//0/1


            FileDelete(FileName6,0);
            FileDelete(FileName7,0);
            file_handle6=FileOpen(FileName6,FILE_READ|FILE_WRITE|FILE_BIN);
            if(file_handle6>0)
              {

               FileSeek(file_handle6,0,SEEK_CUR);

               FileWriteArray(file_handle6,bodydt,0,WHOLE_ARRAY);
               FileClose(file_handle6);
              }

            file_handle7=FileOpen(FileName7,FILE_READ|FILE_WRITE|FILE_BIN);
            if(file_handle7>0)
              {

               FileSeek(file_handle7,0,SEEK_CUR);

               FileWriteArray(file_handle7,bodyAR,0,WHOLE_ARRAY);
               FileClose(file_handle7);
              }

           }
         //------------------------------------//

        }


      if(ALLtoARRAYWRITE==true)
        {


         // ---- Writing Mass to the Binary file of all indicators.
         // ---- Every minute session I write time and data into arrays using an index.
         for(i=1; i<7205; i++)
           {
            if(AllAnalisysData[i,1]==1000)//получаю индекс заполненного элемента
              {
               break;
              }

           }

         DT_AllAnalisysData[i,0]=iTime(Symbol(),0,1);

         AllAnalisysData[i,0]=Counter_Summa0;
         AllAnalisysData[i,1]=Counter_Summa1;
         AllAnalisysData[i,2]=IndexMaximum;
         AllAnalisysData[i,3]=IndexMinimum;
         AllAnalisysData[i,4]=Maximum;
         AllAnalisysData[i,5]=Minimum;
         AllAnalisysData[i,6]=MinPriceSintezINDEX;
         AllAnalisysData[i,7]=MaxBinNumber_1;
         AllAnalisysData[i,8]=MaxBinNumber_0;
         AllAnalisysData[i,9]=MaxMinArr[IndexMaximum]-MaxBinNumber_1;
         AllAnalisysData[i,10]=MaxMinArr[IndexMinimum]+MaxBinNumber_0;
         AllAnalisysData[i,11]=bodypips[MaxInd_bodypips,0];
         AllAnalisysData[i,12]=bodypips[MaxInd_bodypips,1];
         AllAnalisysData[i,13]=BinInd3BO;
         AllAnalisysData[i,14]=BinInd3BE;
         AllAnalisysData[i,15]=Onda1;
         AllAnalisysData[i,16]=LasData;



         int file_handle19=FileOpen(FileName19,FILE_READ|FILE_WRITE|FILE_BIN);
         if(file_handle19>0)
           {

            FileSeek(file_handle19,0,SEEK_CUR);

            FileWriteArray(file_handle19,AllAnalisysData,0,WHOLE_ARRAY);
            FileClose(file_handle19);
           }

         int file_handle20=FileOpen(FileName20,FILE_READ|FILE_WRITE|FILE_BIN);
         if(file_handle20>0)
           {

            FileSeek(file_handle20,0,SEEK_CUR);

            FileWriteArray(file_handle20,DT_AllAnalisysData,0,WHOLE_ARRAY);
            FileClose(file_handle20);
           }
        }
      //}
      //}

      //if((resOperandMin==PriceZero || resOperandMax==PriceZero) && Maximum>0 && Minimum>0 && one_BE>=1 && one_BE<=60 && Rez_BE==0)
      // {

      // }
      //-------------------------------------------
      // string filename_bin=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+"_BIN.bin";
      //int file_handle_BIN=FileOpen(filename_bin,FILE_READ|FILE_WRITE|FILE_BIN );
      // if(file_handle_BIN>0)
      //   {
      //  int i;
      // for(i=0;i<9999;i++)

      //FileReadArray(file_handle_BIN,body,0,i);
      //    Comment(body[i,0]);
      //FileClose(file_handle_BIN);
      //  }



      //FileClose(file_handle_BIN);

      //-----------------------------------------------------------

      // Вариант 1
      /*if(Z_N<500)
                 {MasD[Z_N,0]=(int)Time[1];
                  MasD[Z_N,1]=Counter_Summa1;
                  MasD[Z_N,2]=Counter_Summa0;
                  Z_N++;
                 }
                 else {Z_N=0;ArrayInitialize(MasD,0);}*/
      // Вариант 2
      /*   MasD[Z_N,0]=(int)Time[1];
                  MasD[Z_N,1]=Counter_Summa1;
                  MasD[Z_N,2]=Counter_Summa0;
                  Z_N++;
               if(Z_N>499)
                 {
                  Z_N-=1;
                  for(int qt=0; qt<499; qt++)
                    {
                     MasD[qt,0]=MasD[qt+1,0];
                     MasD[qt,1]=MasD[qt+1,1];
                     MasD[qt,2]=MasD[qt+1,2];
                    }
                  MasD[499,0]=0;
                  MasD[499,1]=0;
                  MasD[499,2]=0;
                 }*/
      // Вариант 3/2
      // op_MasD(Counter_Summa1,Counter_Summa0);

      //---------------------------------------------

      //-------------------------------------------------------------------

      // if(Rez_BE>=0)
      // {
      //string Color1=IntegerToString(Rez_BE,0);
      //string Color2=IntegerToString(one_BE,0);
      //string Color3=IntegerToString(zero_BE,0);
      //string Color=Color1+","+Color2+","+Color3;

      //string rgb="C'"+Color+"'";
      //color  rgbcolor=StringToColor(rgb);
      //ObjectSetInteger(0,Obiekt101,OBJPROP_COLOR,rgbcolor);
      //Comment(rgb);

      // }
      // int file_handle3=FileOpen(FileName3,FILE_READ|FILE_WRITE," ");
      //if(file_handle3>0)
      // {
      //  FileSeek(file_handle3,0,SEEK_END);
      //  FileWrite(file_handle3,Symbol()," ",iTime(Symbol(),0,1),Rez_BE," % ",one_BE,"  ",zero_BE);
      //  FileClose(file_handle3);
      // }
      //-----------------------Tiempo de senal
      // datetime date1=D'00:00:00';
      //datetime date2=D'06:00:00';

      //------------------------------------

      //if(Rez_BE==0 /*&& zero_BE>60*//*&& TimeCurrent()> date2 && TimeCurrent()<date1*/)//--Минусавой сигнал
      // {

      //  if(write_Zero==true)
      //   {
      //    int file_handle2=FileOpen(FileName2,FILE_READ|FILE_WRITE," ");
      //   if(file_handle2>0)
      //  {
      //FileClose(Handle);
      //FileCopy(
      //--

      //    FileSeek(file_handle2,0,SEEK_END);
      //    FileWrite(file_handle2,Symbol()," ",iTime(Symbol(),0,1),Rez_BE," % ",one_BE,"  ",zero_BE);
      //   FileClose(file_handle2);
      //Alert(Rez_BE);
      //string Hora=TimeToString(iTime(Symbol(),0,1));
      //string levelnotificacion=DoubleToString(one_BE);
      //SendNotification(Hora);
      //SendNotification(levelnotificacion);
      //SendFTP(FileName3);

      //---Move Files to destyny foldrer

      //FileCopy(filename,0,filename+copy,0);
      // FileMove(filename,0,"Candles H1+ binmarker\\Analiz\\"+filename,/*|FILE_COMMON|/FILE_REWRITE*/0);

      //-----------------

      //  }

      //  }
      // }



     }

   if(Bar_Tm==0 && time_BR==Time[0])
     {
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrWhite);
      return(0);
     }

   if(Bar_Tm!=Time[0])
     {

      Bar_Tm=Time[0];
      string File_Name_Close=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+"-"+SYmbol+FR_Nm;
      int replacedC=StringReplace(File_Name_Close,":"," ");
      FileClose(replacedC);
      filename=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+"-"+SYmbol+FR_Nm;
      string terminal_data_path=TerminalInfoString(TERMINAL_DATA_PATH);
      File_Name=terminal_data_path+"\\MQL4\\Files\\digitscandlesALL\\"+filename;

      int replaced=StringReplace(File_Name,":"," ");
      File_Name=DoubleToStr(Bar_Tm/60,0)+FR_Nm;
      Str_Pr_Bar=Bid;
      Handle=FileOpen(File_Name_Close,FILE_CSV|FILE_WRITE,";");
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   Bars_Z(Bid);
   Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrOrange);


   return(0);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bars_Z(double iBid)
  {

   int Cqt=0;
   Counter++;

   Cqt=(int)NormalizeDouble((iBid-Str_Pr_Bar)/Point,0);
   int qt_C=0;

   if(Cqt>1)//paso 1 arriba
     {
      for(int qt=0; qt<Cqt-1; qt++)
        {
         qt_C=Counter+qt;
         body[qt_C,0]=3;
         body[qt_C,1]=1;
         body [qt_C,2]=2;
         body [qt_C,3]=Str_Pr_Bar+(qt+1)*Point;
         //body [qt_C,4]=TimeCurrent();//Записываю время тика.
         //bintoarr[IFb1,IFb2]=1;//запись в строку параметров бинарного вычисления
         //bintoarrBID[IFb1,IFb2]=Bid;
         //body [qt_C,7]=iTime(Symbol(),PERIOD_CURRENT,0);
         //---
         // body [qt_C,4]=Open[0];
         // body [qt_C,5]=High[0];
         // body [qt_C,6]=Low[0];
         // body [qt_C,7]=111;//TEST
         FileWrite(Handle,body[qt_C,0],body[qt_C,1],body[qt_C,2],body[qt_C,3],body[qt_C,4],body[qt_C,5],body[qt_C,6],body[qt_C,7]);
         Counter1++;
        }
      Counter=qt_C+1;
     }

   if(Cqt<-1)
     {
      for(int qt=0; qt<MathAbs(Cqt)-1; qt++)
        {
         qt_C=Counter+qt;
         body [qt_C,0]=3;
         body [qt_C,1]=0;
         body [qt_C,2]=3;
         body [qt_C,3]=Str_Pr_Bar-(qt+1)*Point;
         //body [qt_C,4]=TimeCurrent();//Записываю время тика.
         // bintoarr[IFb1,IFb2]=0;
         // bintoarrBID[IFb1,IFb2]=Bid;
         //body [qt_C,7]=iTime(Symbol(),PERIOD_CURRENT,0);
         //---
         // body [qt_C,4]=Open[0];
         // body [qt_C,5]=High[0];
         // body [qt_C,6]=Low[0];
         FileWrite(Handle,body[qt_C,0],body[qt_C,1],body[qt_C,2],body[qt_C,3],body[qt_C,4],body[qt_C,5],body[qt_C,6],body[qt_C,7]);
         Counter0++;
        }
      Counter=qt_C+1;
     }

   if(Str_Pr_Bar<=iBid)
     {
      body [Counter,1]=1;
      body [Counter,2]=1;
      //body [Counter,4]=TimeCurrent();//Записываю время тика.
      //bintoarr[IFb1,IFb2]=1;
      //bintoarrBID[IFb1,IFb2]=Bid;
      Counter1_1++;
     }
   else
     {
      body [Counter,1]=0;
      body [Counter,2]=0;
      //body [Counter,4]=TimeCurrent();//Записываю время тика.
      //bintoarr[IFb1,IFb2]=0;//пишу тик в бинарной интерпретации
      //bintoarrBID[IFb1,IFb2]=Bid;//пишу цену для тика

      Counter0_1++;
     }
   body [Counter,0]=iBid;
   body [Counter,3]=111;
//body [Counter,4]=TimeCurrent();//Записываю время тика.p
// body [Counter,4]=Open[0];
// body [Counter,5]=High[0];
// body [Counter,6]=Low[0];
//body[Counter,7]=iTime(Symbol(),PERIOD_CURRENT,0);

   FileWrite(Handle,body[Counter,0],body[Counter,1],body[Counter,2],body[Counter,3],body[Counter,4],body[Counter,5],body[Counter,6],body[Counter,7]);
   Str_Pr_Bar=iBid;


   Counter_Summa1 = Counter1+Counter1_1;
   Counter_Summa0 = Counter0+Counter0_1;




  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void deinit()
  {

//-------------------------------------------------------------------------

   Str_Pr_Bar=0;
   time_bar=0;
   time_BR=0;
   ObjectsDeleteAll(0,OBJ_LABEL);
   FileClose(Handle);
  }
//+------------------------------------------------------------------+
//|                void Text_OBJ_LABEL()                             |
//+------------------------------------------------------------------+
void Text_OBJ_LABEL(string Nm_T,int CORN,int XD,int YD,string Tx_Znk,int Sz,string Tx_cr,color CLR)
  {
//----
   ObjectCreate(Nm_T,OBJ_LABEL,0,0,0);
   ObjectSet(Nm_T,OBJPROP_CORNER,CORN);
   ObjectSet(Nm_T,OBJPROP_XDISTANCE,XD);
   ObjectSet(Nm_T,OBJPROP_YDISTANCE,YD);
   ObjectSetText(Nm_T,Tx_Znk,Sz,Tx_cr,CLR);
   ObjectSet(Nm_T,OBJPROP_HIDDEN,true);
   ObjectSet(Nm_T,OBJPROP_SELECTABLE,false);

//---
  }

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+

