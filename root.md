# Root
//+------------------------------------------------------------------+
//|                                             Yevheniy             |
//|                                             Nucleo   v 1.6.0.mq4 |
//|                                                                  |
//+------------------------------------------------------------------+


#property copyright "Yevheniy Kopanitskyy"
#property link      ""
#property version   "1.7"
#property strict


//-----EXTERNAL VAR-----
extern bool LongPosition=false;//Long
extern bool ShortPosition=false;//Short
extern bool BinIndWRITE=false;
extern bool ALLtoARRAYWRITE=false;
extern bool BODYHorizont=false;
//--END---EXTERNAL VAR-----
//------Импортирование библиотеки ТЕЛЕГРАММ - Отправка сообщений в канал------------------------------
#import "Telegram4Mql.dll"
string TelegramSendTextAsync(string apiKey,string chatId,string chatText);
string TelegramSendText(string apiKey,string chatId,string chatText);
string TelegramSendScreenAsync(string apiKey,string chatId,string caption="");
string TelegramSendScreen(string apiKey,string chatId,string caption="");
string TelegramGetUpdates(string apiKey,string validUsers,bool confirmUpdates);
string TelegramSendPhoto(string apiKey,string chatId,string filePath,string caption="");
string TelegramSendPhotoAsync(string apiKey,string chatId,string filePath, string caption = "");
string TelegramSendDocument(string apiKey, string chatId, string filePath, string caption = "");
string TelegramSendDocumentAsync(string apiKey,string chatId,string filePath,string caption="");
//...
#import
//---END---Импортирование библиотеки ТЕЛЕГРАММ - Отправка сообщений в канал------------------------------


//------ARRAYS-----
double body[99999,20];
//double BinaryKeys[9999,2000];
int MaxMinArr[99999];
double kompa[10000];//para calculo de precio minimo
double kompa1[10000];//para calculo de precio maximo
datetime PIPS_COL_DT[99999]; //Массив для времени цены
double  PIPS_COL_Price[99999,6];//Массив для цены и индикаторов
int bbb[1681,3];//Массив для записи классов сигнала
int bbb_compare[9999,2,1681];//Поле 1 это индекс сигнала из основной базы, поле 2 Колличество повторений сигнала, Сигнал это страница
//int priceBEBO[100000,2];//Массив для просмотра бинарного поля цены, инициализирую числом 2
double AllAnalisysData[7205,20];
datetime DT_AllAnalisysData[7205,1];
double BodyHorizont_Bin[7210,2000];
double BodyHorizont_Price[7210,2000];
datetime BodyHorizont_Time[7210];
double bodyAR[90000,50];//Массив для записи в переменные и Бин фаил
datetime bodydt[90000];//массив для записи времени
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
double bodypips[99999,5];//Массив для анализа данных по методу Подсолнух
double comp_bodypips[99999];//Массив для сапаставления и получения максимального значения
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
double BoolInd;//Bool сила
double BearInd;
double Maximum;//bool
double Minimum;
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
//---END---INTEGER VARS-----
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
string FileName4=SYmbol+" Long&Short-Signals.txt";
//string FileName5=SYmbol+" LEVELS PRICE.txt";
string FileName6=SYmbol+" indexarray.bin";
string FileName7=SYmbol+" alltoarray.bin";
string FileName8=SYmbol+" BinaryKeys_BIN.bin";
string FileName9=SYmbol+" BinaryKeys_BID.bin";
string FileName10=SYmbol+" BinaryKeys_TIME.bin";
string FileName12="bbb.bin";
string FileName11=SYmbol+" BinaryKeys-Repit_TIME.bin";//массив в котором хранятся повторы ключей по времени, если повтор был то фиксируется время открытия свечи
string FileName13="bbb_compare.bin";
string FileName14=SYmbol+" PIPS_COLLECTION.txt";
string FileName15=SYmbol+" PIPS_COL_DT.bin";
string FileName16=SYmbol+" PIPS_COL_Price.bin";
string FileName17=SYmbol+" DataCompare.txt";
//string FileName18=SYmbol+" priceBEBO.bin";//Фаил отгрузки и загрузки
string FileName19=SYmbol+" AllAnalisysData.bin";
string FileName20=SYmbol+" DT_AllAnalisysData.bin";
string FileName21=SYmbol+"BodyHorizont_Bin.bin";
string FileName22=SYmbol+"BodyHorizont_Price.bin";
string FileName23=SYmbol+"BodyHorizont_Time.bin";
string apikey="630515987:AAHk0ChIBaW3aOZBP1mFQBSK-4HXsBvbB6I";
string chatid="-1001177290832";//654751710 bot chat
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
//---РЕВИЗИИ---//
//---1.7.1
//---Добавлена включение и отключение записи в массивы ALLtoARRAYWRITE
//---Добавлена включение и отключение записи в массивы BODYHorizont
//---Добавлена смена переменной ONE_be в int в цикле передачи в сообщений в телеграм и записи данных в файл 

//---инициализация массивов
   ArrayInitialize(body,10);
   ArrayInitialize(bodypips,0);
   ArrayInitialize(comp_bodypips,0);
   ArrayInitialize(PIPS_COL_DT,0);
   ArrayInitialize(PIPS_COL_Price,0);
// ArrayInitialize(priceBEBO,2);//Массив инициализирую числом 
   ArrayInitialize(AllAnalisysData,1000);//Массив инициализирую числом 
   ArrayInitialize(BodyHorizont_Bin,10);
   ArrayInitialize(BodyHorizont_Price,10);

//------------------------
//---Инициализация Телеграм Бота

TelegramSendText(apikey,chatid,"Tatiana_Bot_Initialized_V_1.7");

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
//----------------------------------------

//---- завершение инициализации
//--Работа с графиками---

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

//---
   printdesc1=1;
   printdesc2=0;
   printdesc3=0;
   printdesc4=0;
   printdesc5=0;
//------
// ObjectDelete(RectanglLabel);
// RectanglLabel="703";
   CHWPX=-1;
   ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0,CHWPX);
//-----обиект прямоугольное окно



//-------------------------
   BrTime=iTime(Symbol(),0,1);
   HIGHT=iHigh(Symbol(),0,1);
//   ObjectDelete(Obiekt101);
// ObjectCreate(0,Obiekt101,OBJ_ARROW_THUMB_UP,0,BrTime,HIGHT+0.00010);
//ObjectSetString(0,Obiekt101,OBJPROP_BMPFILE,file1);
//   ObjectSetInteger(0,Obiekt101,OBJPROP_XDISTANCE,100);
//   ObjectSetInteger(0,Obiekt101,OBJPROP_YDISTANCE,15);
//   ObjectSetInteger(0,Obiekt101,OBJPROP_WIDTH,25);
//   ObjectSetInteger(0,Obiekt101,OBJPROP_COLOR,clrRed);
   im=0;





//---
   ArrayInitialize(bodyAR,61);
//-----------------------Загрзуска Файлов bbb.bin i bbb_compare.bin в массив---------------------------//
   int file_handle12=FileOpen(FileName12,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка bbb.bin
   Print("HANDLE bbb.bin ",file_handle12);
   if(file_handle12>0)
     {

      FileSeek(file_handle12,0,SEEK_CUR);

      uint test=FileReadArray(file_handle12,bbb,0,WHOLE_ARRAY);
      Print("READ bbb.bin ",test);
      FileClose(file_handle12);
     }
//-----------------------------------------------------------------------------------
   int file_handle13=FileOpen(FileName13,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
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
//-----------------------------------------------------------------------------------

   int file_handle17=FileOpen(FileName21,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
   if(file_handle17>0)
     {

      FileSeek(file_handle17,0,SEEK_CUR);

      uint test=FileReadArray(file_handle17,BodyHorizont_Bin,0,WHOLE_ARRAY);
      FileClose(file_handle17);
     }
//-----------------------------------------------------------------------------------

   int file_handle18=FileOpen(FileName22,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
   if(file_handle18>0)
     {

      FileSeek(file_handle18,0,SEEK_CUR);

      uint test=FileReadArray(file_handle18,BodyHorizont_Price,0,WHOLE_ARRAY);
      FileClose(file_handle18);
     }
//-----------------------------------------------------------------------------------

   int file_handle19=FileOpen(FileName23,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
   if(file_handle19>0)
     {

      FileSeek(file_handle19,0,SEEK_CUR);

      uint test=FileReadArray(file_handle19,BodyHorizont_Time,0,WHOLE_ARRAY);
      FileClose(file_handle19);
     }
//---
   time_BR=Time[0];
   if(time_BR!=0)
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrGreen);
   else
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrRed);
//---
   return(0);


  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
int start()
  {


   if(time_bar!=Time[0])
     {

      //----
      time_bar=Time[0];
      //----разварот записи массива body и запись данных в массив недели
      //---Записываю  в 3 массива используя индекс.Массив 1 Бинарная секвенция Массив 2 цена соответствующася бинарной секвенции 3 время открытия свечи
      //---Нужно обьеденять данные массива отдельным скриптом
      //---массивы имеют размер 7210 линий и 10000 ширина
      //BodyHorizont_Bin[7210,2000];
      //BodyHorizont_Price[7210,2000];
      //BodyHorizont_Time[7210];
      //узнаю индекс массива
      int inx;
      for(inx=1; inx<7210; inx++)
        {
         if(BodyHorizont_Bin[inx,1]==10)//индекс заполняемой строки в массиве
           {
            break;
           }
        }
      //перезаписываю из вертикали в горизонталь
      //Присваиванеи значений времени свечи в массив
      BodyHorizont_Time[inx]=iTime(Symbol(),0,1);
      //Определение глубены записи в массив
      int inx_1;
      for(inx_1=1; inx_1<99999; inx_1++)
        {
         if(body[inx_1,0]==10)//номер строки где окончилась запись в массив
           {
            break;
           }
        }
      //Добавить использавание проскакивания Геп в верх или низ
      //Для гепа использавать вычисления определяющие колличество пипсов.
      //Коррекция первого значения по предыдущей записи.
      //Нужно выбрать значение последнего эелемнта в массиве
      //Присваиванеи значений бинарного кода в массив BodyHorizont_Bin и BodyHorizont_Price и сравнить с первым значением цены и бинкода в массиве Боди
      // Если цена таже что и в боди то новой записи присваивается значение последней записи массива БодиГоризонт пример Боди 1 1,13200  и боди горизонт 1 1,13200
      // Если цена таже что и в боди то новой записи присваивается значение последней записи массива БодиГоризонт пример Боди 1 1,13200  и боди горизонт 0 1,13200 то в боди меняем значение на 0
      // если цена в боди снизилась  от цены бодигоризонт то устанавливаем 0 елсли посысилась то устанавлимаем 1
      //определяем конец предыдущей записи в массиве BodyHorizont_Bin через цикл фор
      int fg;
      int swi=0;//Переключатель
      if(inx>1)// первая запись в массиве пропускается
        {
         for(fg=1; fg<2000; fg++)
           {
            //Print("fg ",fg);
            if(BodyHorizont_Bin[inx-1,fg]==10)//Получаю индекс последней записи
              {
               break;
              }
           }
         //------------Определение гепа при открытии нового бара
         double PipsDif;
         if(inx>1 && body[1,0]<3)// первая запись в массиве пропускается
           {
            if(BodyHorizont_Price[inx-1,fg-1]!=body[1,0])
              {
               if(BodyHorizont_Price[inx-1,fg-1]>body[1,0])//Цена закрытия больше цены открытия значит цена опустилась
                 {
                  PipsDif=(BodyHorizont_Price[inx-1,fg-1]-body[1,0])*100000;//Получаю колличество пипсов разницы в цене
                  swi=1;
                 }
               if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])//Цена закрытия больше цены открытия значит цена опустилась
                 {
                  PipsDif=(body[1,0]-BodyHorizont_Price[inx-1,fg-1])*100000;//Получаю колличество пипсов разницы в цене
                  swi=2;
                 }
              }
           }

         if(inx>1 && body[1,3]<3)// первая запись в массиве пропускается
           {
            if(BodyHorizont_Price[inx-1,fg-1]!=body[1,3])
              {
               if(BodyHorizont_Price[inx-1,fg-1]>body[1,3])//Цена закрытия больше цены открытия значит цена опустилась
                 {
                  PipsDif=(BodyHorizont_Price[inx-1,fg-1]-body[1,3])*100000;//Получаю колличество пипсов разницы в цене
                  swi=1;
                 }
               if(BodyHorizont_Price[inx-1,fg-1]<body[1,3])//Цена закрытия больше цены открытия значит цена опустилась
                 {
                  PipsDif=(body[1,3]-BodyHorizont_Price[inx-1,fg-1])*100000;//Получаю колличество пипсов разницы в цене
                  swi=2;
                 }
              }
           }
         //---------Перезаписываю массивы для дозаписи значений
         double body_Plus[99999,20];//Массив для перезаписи
         //---------Перебрасываю значения массива боди в боди плюс
         int fgf;
         int fgi;
         int fgo;
         if(inx>1)// первая запись в массиве пропускается
           {
            for(fgf=1; fgf<99999; fgf++)
              {
               //Print("fg ",fg);
               if(body[fgf,0]==10)//Получаю индекс последней записи
                 {
                  break;
                 }
              }
           }
         //---------Перезаписываю массивы-----------------
         for(fgo=0; fgo<4; fgo++)
           {
            for(fgi=1; fgi<fgf; fgi++)
              {
               body_Plus[fgi,fgo]=body[fgi,fgo];//Присваиваю значения

              }
           }

         //--------Заполняю массив значениями гепа

         if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])//Если цена одинакова в массивах и бинарный код тоже то пропускаю действие
           {
            if(body[1,0]<3)
              {
               ArrayInitialize(body,10);//---------Боди обнуляю
               if(swi==2)
                 {
                  for(int fgw=0; fgw<PipsDif+1; fgw++)
                    {

                     body[fgw,0]=BodyHorizont_Price[inx-1,fg-1]+0.00001;//Присваиваю значения цены
                     body[fgw,1]=1;//Присваиваю значения бинарного кода
                    }
                 }
              }
           }

         //Comment("fg ",inx-1,"fg ",fg);
         //Сравнение 2 массивов корректирую запись бинарного кода в массиве боди
         if(BodyHorizont_Price[inx-1,fg-1]<body[1,0])//Если цена одинакова в массивах и бинарный код тоже то пропускаю действие
           {
            body[1,1]=1;//Если цена в боди больше чем в бодигоризон то присваиваю 1
           }
         if(BodyHorizont_Price[inx-1,fg-1]>body[1,0])//Если цена одинакова в массивах и бинарный код тоже то пропускаю действие
           {
            body[1,1]=0;//Если цена в боди меньше чем в бодигоризон то присваиваю 0
           }
         if(BodyHorizont_Price[inx-1,fg-1]==body[1,0] && BodyHorizont_Bin[inx-1,fg-1]!=body[1,1])//Если цена одинакова в массивах и бинарный код тоже то пропускаю действие
           {
            body[1,1]=BodyHorizont_Bin[inx-1,fg-1];//Если цена в боди больше чем в бодигоризон то присваиваю 1
           }
        }



      int inx_2;
      for(inx_2=1; inx_2<inx_1; inx_2++)
        {
         BodyHorizont_Bin[inx,inx_2]=body[inx_2,1];//присваиваю значения из массива боди - вертикальное заполнение в бопдигоризонт - вертикальное заполнение. заполняю из столбца 1

        }
      //Присваиванеи значений цены в массив
      for(inx_2=1; inx_2<inx_1; inx_2++)
        {

         if(body[inx_2,0]<2 && body[inx_2,0]!=3)//Присваиванеи значения если в 0 столбце значение меньше 0
           {
            BodyHorizont_Price[inx,inx_2]=body[inx_2,0];//присваиваю значения из массива боди - вертикальное заполнение в бопдигоризонт - вертикальное заполнение. заполняю из столбца 1
           }
         if(body[inx_2,0]==3)//Присваиванеи значения если в 0 столбце значение 3
           {
            BodyHorizont_Price[inx,inx_2]=body[inx_2,3];//присваиваю значения из массива боди - вертикальное заполнение в бопдигоризонт - вертикальное заполнение. заполняю из столбца 1
           }

        }


      if(BODYHorizont==true)
        {
         //Запись массивов в бинарный фаил
         //---ДОБАВИТЬ СМЕНУ ИМЕНИ ФАЙЛА НА x_НАЗВАНИЕФАЙЛА
         //-----------------------------------------------------------------------------------

         int file_handle21=FileOpen(FileName21,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
         if(file_handle21>0)
           {

            FileSeek(file_handle21,0,SEEK_CUR);

            uint test=FileWriteArray(file_handle21,BodyHorizont_Bin,0,WHOLE_ARRAY);
            FileClose(file_handle21);
           }
         //-----------------------------------------------------------------------------------

         int file_handle22=FileOpen(FileName22,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
         if(file_handle22>0)
           {

            FileSeek(file_handle22,0,SEEK_CUR);

            uint test=FileWriteArray(file_handle22,BodyHorizont_Price,0,WHOLE_ARRAY);
            FileClose(file_handle22);
           }
         //-----------------------------------------------------------------------------------

         int file_handle23=FileOpen(FileName23,FILE_READ|FILE_WRITE|FILE_BIN);//Загрузка
         if(file_handle23>0)
           {

            FileSeek(file_handle23,0,SEEK_CUR);

            uint test=FileWriteArray(file_handle23,BodyHorizont_Time,0,WHOLE_ARRAY);
            FileClose(file_handle23);
           }
        }
      //-----процес тестиравания
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
         //-----
         //---Функция BigPipsFinder-----------
         price_Menus_one=bodypips[MaxInd_bodypips,0];
         pips_Menus_one=bodypips[MaxInd_bodypips,1];

         ArrayInitialize(bodypips,0);
         ArrayInitialize(comp_bodypips,0);
         if(body[1,0]>0 && body[1,0]<3)
           {
            if(body[1,1]==1)//Если в бинарной ячейке 1 то указуваем на цену выше + 0,00001
              {
               //Указываю на цену
               double price=body[1,0]+0.00001;//Получаю цену указателя
               bodypips[1,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
               bodypips[1,1]=bodypips[1,1]+1;//Увеличиваю значение массива + 1;
              }
            if(body[1,1]==0)//Если в бинарной ячейке 1 то указуваем на цену выше - 0,00001
              {
               //Указываю на цену
               double price=body[1,0]-0.00001;//Получаю цену указателя
               bodypips[1,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
               bodypips[1,1]=bodypips[1,1]+1;//Увеличиваю значение массива + 1;
              }

           }

         if(body[1,3]>0 && body[1,3]<3)
           {
            if(body[1,1]==1)//Если в бинарной ячейке 1 то указуваем на цену выше + 0,00001
              {
               //Указываю на цену
               double price=body[1,3]+0.00001;//Получаю цену указателя
               bodypips[1,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
               bodypips[1,1]=bodypips[1,1]+1;//Увеличиваю значение массива + 1;
              }
            if(body[1,1]==0)//Если в бинарной ячейке 1 то указуваем на цену выше - 0,00001
              {
               //Указываю на цену
               double price=body[1,3]-0.00001;//Получаю цену указателя
               bodypips[1,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
               bodypips[1,1]=bodypips[1,1]+1;//Увеличиваю значение массива + 1;
              }

           }
         //------Обработка цикла со второй строки массива-----
         Switch1=0;//Переключатель между переборами
         for(iaq=2; iaq<99999; iaq++)//Перебор массива Боди
           {
            Switch1=0;//Присваиваю 0 при новом заходе на перещёт
            if(body[iaq,0]>0 && body[iaq,0]<3)
              {
               //----------Обработка 1 --------------
               if(body[iaq,1]==1)//Если в бинарной ячейке 1 то указуваем на цену выше + 0,00001
                 {
                  //Указываю на цену
                  double price=body[iaq,0]+0.00001;//Получаю цену указателя
                  int findeprice=0;//Найдено 0
                  int Break1=0;//выход из перебора 1
                  int Break2=0;//выход из перебора 2
                  for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                    {
                     if(bodypips[ibq,0]==price)//Нахожу записанную цену в массиве.Получаю индекс в массиве
                       {

                        //bodypips[ib,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                        bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                        findeprice=1;//Присваиваю 1 так как вошли в тело
                        Break1=1;//Присваиваю 1 так как вошли в тело
                        Switch1=1;//Функция исполнена переключатся на 3 колонку не нужно
                        break;//Выход по получению
                        //добавить условие выхода из второго щетчика
                       }
                     if(Break1==1)//выходим из тела функции
                       {
                        break;//Выход из перебора
                       }
                    }
                  //---------------Если нет цены то дописывать цену ниже-----------------
                  if(findeprice==0)//Если не найдена цена значит нужно добавить в массив запись
                    {
                     for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                       {
                        if(bodypips[ibq,0]==0)//Нахожу записаннйы  0 в массиве.Получаю индекс в массиве
                          {

                           bodypips[ibq,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                           Break2=1;//Присваиваю 1 так как вошли в тело
                           Switch1=1;//Функция исполнена переключатся на 3 колонку не нужно
                           break;//Выход по получению

                          }
                        if(Break2==1)//выходим из тела функции перебора
                          {
                           break;//Выход из перебора
                          }
                       }
                    }
                 }
               //----------Обработка 0----------------
               if(body[iaq,1]==0)//Если в бинарной ячейке 1 то указуваем на цену выше - 0,00001
                 {
                  //Указываю на цену
                  double price=body[iaq,0]-0.00001;//Получаю цену указателя
                  int findeprice=0;//Найдено 0
                  int Break1=0;//выход из перебора 1
                  int Break2=0;//выход из перебора 2
                  Switch1=1;//Функция исполнена переключатся на 3 колонку не нужно
                  for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                    {
                     if(bodypips[ibq,0]==price)//Нахожу записанную цену в массиве.Получаю индекс в массиве
                       {

                        //bodypips[ib,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                        bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                        findeprice=1;//Присваиваю 1 так как вошли в тело
                        Break1=1;//Присваиваю 1 так как вошли в тело
                        break;//Выход по получению
                        //добавить условие выхода из второго щетчика
                       }
                     if(Break1==1)//выходим из тела функции
                       {
                        break;//Выход из перебора
                       }
                    }
                  //---------------Если нет цены то дописывать цену ниже-----------------
                  if(findeprice==0)//Если не найдена цена значит нужно добавить в массив запись
                    {
                     for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                       {
                        if(bodypips[ibq,0]==0)//Нахожу записаннйы  0 в массиве.Получаю индекс в массиве
                          {

                           bodypips[ibq,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                           Break2=1;//Присваиваю 1 так как вошли в тело
                           Switch1=1;//Функция исполнена переключатся на 3 колонку не нужно
                           break;//Выход по получению

                          }
                        if(Break2==1)//выходим из тела функции перебора
                          {
                           break;//Выход из перебора
                          }
                       }
                    }

                 }
               //---
              }
            if(Switch1==0)//Если переключатель равен 1 то перебераем столбец 3
              {

               //------------Если запись цены в массиве находится в столбце 3-----------------
               if(body[iaq,3]>0 && body[iaq,3]<3)
                 {
                  //----------Обработка 1 --------------
                  if(body[iaq,1]==1)//Если в бинарной ячейке 1 то указуваем на цену выше + 0,00001
                    {
                     //Указываю на цену
                     double price=body[iaq,3]+0.00001;//Получаю цену указателя
                     int findeprice=0;//Найдено 0
                     int Break1=0;//выход из перебора 1
                     int Break2=0;//выход из перебора 2
                     for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                       {
                        if(bodypips[ibq,0]==price)//Нахожу записанную цену в массиве.Получаю индекс в массиве
                          {

                           //bodypips[ib,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                           findeprice=1;//Присваиваю 1 так как вошли в тело
                           Break1=1;//Присваиваю 1 так как вошли в тело
                           break;//Выход по получению
                           //добавить условие выхода из второго щетчика
                          }
                        if(Break1==1)//выходим из тела функции
                          {
                           break;//Выход из перебора
                          }
                       }
                     //---------------Если нет цены то дописывать цену ниже-----------------
                     if(findeprice==0)//Если не найдена цена значит нужно добавить в массив запись
                       {
                        for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                          {
                           if(bodypips[ibq,0]==0)//Нахожу записаннйы  0 в массиве.Получаю индекс в массиве
                             {

                              bodypips[ibq,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                              bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                              Break2=1;//Присваиваю 1 так как вошли в тело
                              break;//Выход по получению

                             }
                           if(Break2==1)//выходим из тела функции перебора
                             {
                              break;//Выход из перебора
                             }
                          }
                       }
                    }
                  //----------Обработка 0----------------
                  if(body[iaq,1]==0)//Если в бинарной ячейке 1 то указуваем на цену выше - 0,00001
                    {
                     //Указываю на цену
                     double price=body[iaq,3]-0.00001;//Получаю цену указателя
                     int findeprice=0;//Найдено 0
                     int Break1=0;//выход из перебора 1
                     int Break2=0;//выход из перебора 2
                     for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                       {
                        if(bodypips[ibq,0]==price)//Нахожу записанную цену в массиве.Получаю индекс в массиве
                          {

                           //bodypips[ib,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                           bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                           findeprice=1;//Присваиваю 1 так как вошли в тело
                           Break1=1;//Присваиваю 1 так как вошли в тело
                           break;//Выход по получению
                           //добавить условие выхода из второго щетчика
                          }
                        if(Break1==1)//выходим из тела функции
                          {
                           break;//Выход из перебора
                          }
                       }
                     //---------------Если нет цены то дописывать цену ниже-----------------
                     if(findeprice==0)//Если не найдена цена значит нужно добавить в массив запись
                       {
                        for(ibq=1; ibq<99999; ibq++)//Perebor stolbca 1
                          {
                           if(bodypips[ibq,0]==0)//Нахожу записаннйы  0 в массиве.Получаю индекс в массиве
                             {

                              bodypips[ibq,0]=price;//Присваиваю цену в первую ящейку массива.Массив заполнен 0;
                              bodypips[ibq,1]=bodypips[ibq,1]+1;//Увеличиваю значение массива + 1;
                              Break2=1;//Присваиваю 1 так как вошли в тело
                              break;//Выход по получению

                             }
                           if(Break2==1)//выходим из тела функции перебора
                             {
                              break;//Выход из перебора
                             }
                          }
                       }

                    }
                  //---
                 }
              }//if swith1=1
           }//Перебор массива Боди


         //----Получение индекса максимального значения по цене---
         //Перебором массива присвоить значения в массив
         for(int ic=1; ic<99999; ic++)//Perebor stolbca 1
           {
            comp_bodypips[ic]=bodypips[ic,1];//Присваиваю значение с массива 1 в массив 2
            if(bodypips[ic,0]==0)
              {
               break;//Выход из перебора если цена равна 0
              }

           }
         MaxInd_bodypips =ArrayMaximum(comp_bodypips,WHOLE_ARRAY,0);//Получаю индекс в массиве в котором наиболее максимально показал бинарный код на цену
         //Print(" Index conteiner ", bodypips[MaxInd_bodypips,1]," Price conteiner ",bodypips[MaxInd_bodypips,0]," ",bodypips[3,0]," ",bodypips[3,1] );//," Body ",body[3,3]," ",body[3,1]," Body ",body[6,0]," ",body[6,1]

         //-----Формула 2 - Если новая цена больше предыдущей то полученный максимум перевожу в пипсы и сумирую к предыдущей цене (цена+1) цене
         //Если новая цена меньше предыдущей то полученный максимум перевожу в пипсы  и минусую от предыдущей цены (цена-1) цены.
         //Полученный результат сравниваю с текущей ценой. Если цена поднялась и текущая цена меньше цены-1 плюс пипсы значит цена внутри
         //Если цена опустилась и цена больше  цены-1 минус пипсы значит цена внутри Обусловлю 0
         //Если цена поднялась и текущая цена больше цены-1 плюс пипсы значит цена снаружи
         //Если цена опустилась и цена меньше  цены-1 минус пипсы значит цена снаружи и Обусловлю 1
         double PipsPrice=NormalizeDouble(pips_Menus_one*Point,5);//Получаю пипсы в цене
         //Print("pips_Menus_one ",pips_Menus_one," PipsPrice ",PipsPrice);

         BinInd3BO=10;
         BinInd3BE=10;
         if(bodypips[MaxInd_bodypips,0]>price_Menus_one)
           {
            price_plus=price_Menus_one+PipsPrice;//Сумиравал к цене -1 пипсы максимума -1
            //Print(" price_plus ",price_plus);

            if(bodypips[MaxInd_bodypips,0]<price_plus)//Если текущая цена меньше Полученной цены с пипсами значит цена внутри присвоить 1
              {
               BinInd3=0;
               BinInd3BO=0;

               Bo="Bo_"+IntegerToString(BinInd3);

              }
            if(bodypips[MaxInd_bodypips,0]>price_plus)//Если текущая цена меньше Полученной цены с пипсами значит цена внутри присвоить 1
              {
               BinInd3=1;
               BinInd3BO=1;
               Bo="Bo_"+IntegerToString(BinInd3);
              }
           }
         //------------------------------------------------

         if(bodypips[MaxInd_bodypips,0]<price_Menus_one)
           {
            price_minus=price_Menus_one-PipsPrice;//Отминусавал от цены -1 пипсы максимума -1
            if(bodypips[MaxInd_bodypips,0]>price_minus)//Если текущая цена меньше Полученной цены с пипсами значит цена внутри присвоить 1
              {
               BinInd3=0;
               BinInd3BE=0;
               Be="Be_"+IntegerToString(BinInd3);
              }
            if(bodypips[MaxInd_bodypips,0]<price_minus)//Если текущая цена меньше Полученной цены с пипсами значит цена внутри присвоить 1
              {
               BinInd3=1;
               BinInd3BE=1;
               Be="Be_"+IntegerToString(BinInd3);
              }
           }

         //--------Сканер бинарного поля цены
         //--------По приходу минуты пишем в массив изменения цены присваивая значение полученние индикатором
         //--------------Фаза 1-------------//Вычисление. Получаю колличество пипсов пройденных ценой за период 1 и 2.
         Price1=Price0;
         Price0=bodypips[MaxInd_bodypips,0];
         //Print(" Price1 ",Price1," Price0 ",Price0);
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

            //--------------Фаза 2-------------//Деление полученных пипсов на число инидкатора
            Onda1=NormalizeDouble(CurPips/bodypips[MaxInd_bodypips,1],2);
            Print(" CurPips ",CurPips," Onda1 ",Onda1);

           }
         //----------------------------конец
         //----Присвоить значения в массивы

         //---Найдём посленюю запись------
         int indmas;//Index
         for(indmas=1; indmas<99999; indmas++)
           {
            if(PIPS_COL_Price[indmas,0]==0)//В нулевую записываю цену
              {

               break;
              }
           }

         if(bodypips[MaxInd_bodypips,0]>price_Menus_one)
           {
            PIPS_COL_Price[indmas,2]=0;//Тип бул
            PIPS_COL_Price[indmas,3]=1;//Подтип 0/1
           }
         if(bodypips[MaxInd_bodypips,0]<price_Menus_one)
           {
            PIPS_COL_Price[indmas,2]=1;//Тип бер
            PIPS_COL_Price[indmas,3]=0;//Подтип 0/1
           }

         //-----Время-----
         PIPS_COL_DT[indmas]=iTime(Symbol(),0,1);//записываю время
         //-----Цена------
         PIPS_COL_Price[indmas,0]=bodypips[MaxInd_bodypips,0];//В нулевую записываю цену
         PIPS_COL_Price[indmas,1]=bodypips[MaxInd_bodypips,1];//Максимальное значение индекса-


         //int file_handle15=FileOpen(FileName15,FILE_READ|FILE_WRITE|FILE_BIN);
         //if(file_handle15>0)
         // {

         // FileSeek(file_handle15,0,SEEK_CUR);

         //FileWriteArray(file_handle15,PIPS_COL_DT,0,WHOLE_ARRAY);
         // FileClose(file_handle15);

         //  }
         // int file_handle16=FileOpen(FileName16,FILE_READ|FILE_WRITE|FILE_BIN);
         // if(file_handle16>0)
         //  {

         // FileSeek(file_handle16,0,SEEK_CUR);

         //FileWriteArray(file_handle16,PIPS_COL_Price,0,WHOLE_ARRAY);
         // FileClose(file_handle16);

         //}



         //Print(bodypips[MaxInd_bodypips,0]>price_plus,"   ",bodypips[MaxInd_bodypips,0]<price_plus);
         //Print(bodypips[MaxInd_bodypips,0]>price_minus,"   ",bodypips[MaxInd_bodypips,0]<price_minus);

         //-----------Принтинг Собраных значений в Фаил --------
         if(bodypips[MaxInd_bodypips,0]>price_Menus_one && (bodypips[MaxInd_bodypips,0]>price_plus ||bodypips[MaxInd_bodypips,0]<price_plus))
           {
            int file_handle14=FileOpen(FileName14,FILE_READ|FILE_WRITE," ");
            if(file_handle14>0)
              {


               FileSeek(file_handle14,0,SEEK_END);
               FileWrite(file_handle14,Symbol()," TIME ",iTime(Symbol(),0,1)," PRICE ",bodypips[MaxInd_bodypips,0]," INDEX CONTEINER ",bodypips[MaxInd_bodypips,1]," BinInd 3 ",Bo," Onda1UP ",Onda1);
               FileClose(file_handle14);

              }
           }
         if(bodypips[MaxInd_bodypips,0]<price_Menus_one && (bodypips[MaxInd_bodypips,0]>price_minus || bodypips[MaxInd_bodypips,0]<price_minus))
           {
            int file_handle14=FileOpen(FileName14,FILE_READ|FILE_WRITE," ");
            if(file_handle14>0)
              {


               FileSeek(file_handle14,0,SEEK_END);
               FileWrite(file_handle14,Symbol()," TIME ",iTime(Symbol(),0,1)," PRICE ",bodypips[MaxInd_bodypips,0]," INDEX CONTEINER ",bodypips[MaxInd_bodypips,1]," BinInd 3 ",Be," Onda1DOWN ",Onda1);
               FileClose(file_handle14);

              }
           }
        }//End funcions

      //---------Отрисовка на графике 2 линий индикатора--------------



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
      //---Библиотека
      //Отсуда выводить данные в библиотеку.
      //сбрасывать все переменные
      //----
      //-----
      //Print(TelegramSendText(apikey, chatid, "test"));
      //--
      im=im++;
      //--замена функции на перещёт в массиве
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
         if(body[ik,1]==1)//Проверить нужно ли установить перещёт с 0 - что находится в ячейке ik,1
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
      //Print("Counter_Summa1_AR ",Counter_Summa1_AR," Counter_Summa0_AR ",Counter_Summa0_AR);
      //Print();
      int one_BE=Counter_Summa1_AR;
      int zero_BE=Counter_Summa0_AR;
      double Rez_BE=one_BE-zero_BE;
      //Print("one_BE ",one_BE," zero_BE ",zero_BE," Rez_BE ",Rez_BE);
      //-------Escritura de parametros de array al fichero binario
      //if(Rez_BE==0 && one_BE<=60)
      //{



      //-----Запись Расщёта Уравней в фаил---//
      //int file_handle5=FileOpen(FileName5,FILE_READ|FILE_WRITE," ");
      //if(file_handle5>0)
      // {
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
      //---Lines calculation------
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
      
      //ДОБАВИТь расчёт ПИ для дальнейшей записи в массив и анализа

      //  FileSeek(file_handle5,0,SEEK_END);
      // FileWrite(file_handle5,Symbol(),"; ",iTime(Symbol(),0,1),";",one_BE," ;UP1;",LEVELUP," ;UP2;",IpaintFiboLineUP_2,";UP3;",IpaintFiboLineUP_3,";UP5;",IpaintFiboLineUP_5,";UP8;",IpaintFiboLineUP_8,";UP13;",IpaintFiboLineUP_13,";UP21;",IpaintFiboLineUP_21,";UP34;",IpaintFiboLineUP_34,";UP55;",IpaintFiboLineUP_55,";UP89;",IpaintFiboLineUP_89,";UP144;",IpaintFiboLineUP_144,";DOWN1;",LEVELDOWN,";DOWN2;",IpaintFiboLineDOWN_2,";DOWN3;",IpaintFiboLineDOWN_3,";DOWN5;",IpaintFiboLineDOWN_5,";DOWN8;",IpaintFiboLineDOWN_8,";DOWN13;",IpaintFiboLineDOWN_13,";DOWN21;",IpaintFiboLineDOWN_21,";DOWN34;",IpaintFiboLineDOWN_34,";DOWN55;",IpaintFiboLineDOWN_55,";DOWN89;",IpaintFiboLineDOWN_89,";DOWN144;",IpaintFiboLineDOWN_144,";");
      // FileClose(file_handle5);
      // }

      k=0;
      ArrayInitialize(MaxMinArr,0);

      int inf;
      int ic;
      for(ic=1; ic<99999; ic++)//Получаю число индекса при первом 0. Если 0 находится на позиции 3 то индексом будет 3
        {
         if(body[ic,0]==10)
           {
            break;
           }
        }
      inf=ic-1;
      //----------------------------
      //if(body[1,0]>0|| body[1,1]>0 || body[1,3]>0)
      // {
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
      //  }
      //-----------------------------
      int ina;
      for(ina=2; ina<=inf; ina++)
        {
         //if(body[ina,0]>0|| body[ina,1]>0 || body[ina,3]>0)
         //  {

         if(body[ina,1]==1)
           {
            k++;
           };
         if(body[ina,1]==0)
           {
            k--;
           };
         MaxMinArr[ina]=k;
         // }
        }

      //--Maximum - minimum INDEX ARRAY
      IndexMaximum=ArrayMaximum(MaxMinArr,WHOLE_ARRAY,0);//Получаю максимальное число из массива
      IndexMinimum=ArrayMinimum(MaxMinArr,WHOLE_ARRAY,0);//Получаю минимальное число из массива
      //--------Max Min Numbers
      Maximum=MathAbs(MaxMinArr[IndexMaximum]);//bool
      Minimum=MathAbs(MaxMinArr[IndexMinimum]);//bear
      //---Последняя цифра показывает на тип сопротивления которое образовалось в нутри свечи---//
      int LasData=MaxMinArr[inf];//Используется для индикатора дивергенции


      //-------------Тест Отработка ошибок после перезборки ----------
      //int file_handle17=FileOpen(FileName17,FILE_READ|FILE_WRITE," ");
      //if(file_handle17>0)
      //{

      // FileSeek(file_handle17,0,SEEK_END);

      //FileWrite(file_handle17,Symbol()," IndexMaximum ",IndexMaximum," IndexMinimum ",IndexMinimum," Maximum ", Maximum," Minimum ",Minimum," | ");
      //FileClose(file_handle17);
      // }

      //-------Sinapsis de precios-------------------

      double komp1[99999];//Массив для отображения синапса в записи
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


      int inr1=inr-1;//Определён конец заполненности массива

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



      //---------------------Arrays
      int ArrayMaximum_0[10000];//999999
      int ArrayMaximum_1[10000];//999999
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

      int If=i-1;//index encontrado con ultima inscripcion.

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
         //Print("Nachalo ",in1);
         //Print("Nachalo Permis ",Permis);1
         if(Permis==1)
           {
            if(body[in1,1]==body[in1+1,1] && body[in1,1]==1 && body[in1+1,1]==1)
              {
               count_1++;//4,3,0//4/3
               //Print("count_1 ",count_1);
              }

            if(body[in1,1]!=body[in1+1,1] /*&& ((body[in1,1]==0 && body[in1+1,1]==1) ||(body[in1,1]==1 && body[in1+1,1]==0))*/)//1/0;0/1
              {
               //Print("acces 1");
               //Print("Permis 1 ",Permis);
               ArrayMaximum_1[ArM1]=count_1;//4
               ArM1++;//Увеличиваю значение индекса на 1 для ArrayMaximum_1
               //  Print("ArM1 ",ArM1);
               Permis=0;//Разришаю продолжить по щётчику с блоко нолей
               //  Print("Permis 1 ",Permis);
               in1++;
               count_1=1;
               //break;
              }
           }
         //Print("Seredina Permis ",Permis);
         if(Permis==0)
           {
            // Print("Переход ",in1);
            if(body[in1,1]==body[in1+1,1] && body[in1,1]==0 && body[in1+1,1]==0)
              {
               count_0++;//2,3,0
              }
            if(body[in1,1]!=body[in1+1,1] /*&& ((body[in1,1]==0 && body[in1+1,1]==1)||(body[in1,1]==1 && body[in1+1,1]==0))*/) // 1/0;0/1
              {
               ArrayMaximum_0[ArM0]=count_0;
               ArM0++;//Увеличиваю значение индекса на 1 для ArrayMaximum_0
               Permis=1;//Разришаю продолжить по щётчику с блоко нолей
               count_0=1;
               //break;
              }

           }
         //Print("Конец ",in1);
         //Print("Konec Permis ",Permis);

        }

      MaxBinNumber_1Index=ArrayMaximum(ArrayMaximum_1,WHOLE_ARRAY,0);//Получаю Максимальное число из массива
      MaxBinNumber_0Index=ArrayMaximum(ArrayMaximum_0,WHOLE_ARRAY,0);//Получаю минимальное значение из массива

      MaxBinNumber_1=(ArrayMaximum_1[MaxBinNumber_1Index]);//Присваиваю полученное значение в переменную
      MaxBinNumber_0=(ArrayMaximum_0[MaxBinNumber_0Index]);//Присваиваю полученное значение в переменную
      
      //-------индикатор Компенсации
      int compensation_1,compensation_2;
      compensation_1=MaxMinArr[IndexMaximum]-MaxBinNumber_1; //bool
      compensation_2=MaxMinArr[IndexMinimum]+MaxBinNumber_0; //bear
      //---------Test de los valores recibidos-----------

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


      for(i=1; i<99999; i++)//Получаю число индекса при певом 0. Если 0 находится на позиции 3 то индексом будет 3
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

      //-------------Обработка сигнала с класификацией и записью в массив bbb_compare-----------------//
      if(Rez_BE==0)
        {
         int ibbb;// индекс который будет соответствавать странице в массиве.
         for(ibbb=1; ibbb<1681; ibbb++)
           {

            if(one_BE>15 && bbb[ibbb,0]==Maximum-MaxBinNumber_1 && bbb[ibbb,1]==MaxMinArr[IndexMinimum]+MaxBinNumber_0) //Получение цены по индексу Индикатор BoolN Если
              {

               int ibb;
               //Print("indexbbb ",ibbb);
               //---Можем писать класс из bbb  в виде bbb[i,2]
               for(ibb=1; ibb<9999; ibb++)//Ищу столбец переборам
                 {
                  if(bbb_compare[ibb,0,ibbb]==0)//Indeks ibbb страница,ibb номер строки
                    {
                     //Print("bbb_compare[ibb,0,ibbb] ", bbb_compare[ibb,0,ibbb]);
                     bbb_compare[ibb,0,ibbb]=iarw;//Пишу индекс сигнала  массивa  bintoarray в bbb_compare
                     //Print("bbb_compare[ibb,0,ibbb] ", bbb_compare[ibb,0,ibbb]);
                     //Print("ibb-1 ", ibb-1);
                     //Print("iarw ", iarw);
                     int SignalCuant=bbb_compare[1,1,ibbb];//Присваиваю значение в переменную для увеличения колличества записанных сигналов
                     SignalCuant++;//Увеличиваю на 1
                     //Print("SignalCuant", SignalCuant);
                     bbb_compare[1,1,ibbb]=SignalCuant;//Присваиваю новое значение
                     //Print("bbb_compare[1,1,ibbb]", bbb_compare[1,1,ibbb]);
                     //---------------Записываю данные в массив с предварительным удалением данных.
                     int file_handle13=FileOpen(FileName13,FILE_READ|FILE_WRITE|FILE_BIN);
                     //Print("HANDLE ",file_handle13);
                     if(file_handle13>0)
                       {

                        FileSeek(file_handle13,0,SEEK_CUR);

                        uint test =FileWriteArray(file_handle13,bbb_compare,0,WHOLE_ARRAY);
                        Print("WRITED ",test);
                        FileClose(file_handle13);


                       }
                     break;
                    }


                  //break;
                 }
              }
           }
        }
      //--int file_handle4-запись синапсов в фаил----------

      //FileOpen(FileName4,FILE_READ|FILE_WRITE," ");
      //if(file_handle4>0)
      //{
      // FileSeek(file_handle4,0,SEEK_END);
      // FileWrite(file_handle4,"___________________________________________________________");
      // FileWrite(file_handle4,Symbol()," ",iTime(Symbol(),0,1)," SINAPS INDEX               |");

      // for(int inc=1; inc<99999; inc++)
      // {
      // if(komp1[inc]>0)

      //{
      //  string sinaps_string=IntegerToString(inc,0);
      //  FileWrite(file_handle4,sinaps_string,"                                                        |");
      // }
      // }

      //-------------------------
      //int inw;//index
      // for(inw=1; inw<99999; inw++) //Поиск конца массива боди
      // {
      // if(body[inw,0]==10);
      //  {
      //   break;
      //  }

      //  }
      //int ind1=inw-1;//Конец заполненного массива

      // for(int ind=1; ind<ind1; ind++)
      // {
      // if(body[ind,0]>0  &&  body[ind+1,0]>0 && body[ind+2,0]>0)//Выход из массива по цене
      // {
      // if(body[ind,0]==body[ind+1,0] && body[ind+1,0]==body[ind+2,0] && body[ind,0]!=3 && body[ind+1,0]!=3)
      //{
      // if(body[ind,1]==0 && body[ind+1,1]==1 && body[ind+2,1]==1)
      // {

      //  Sw_On=IntegerToString(ind,0);

      // FileWrite(file_handle4," switch on, position  ",Sw_On);
      // }
      // }
      //  }




      // }




      // FileClose(file_handle4);


      //}


      //-----------------------------------
      //--Recepcion de precio por indice de 0
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
      //-------------------------------
      //---Все зеро
      //for(int i=1; i<122; i++)//Получаю число индекса при певом 0. Если 0 находится на позиции 3 то индексом будет 3
      //if(MaxMinArr[i]==0)
      // {

      //Print("Zero position - ",i);
      //}


      //-------Indicador


      //Print(iTime(Symbol(),0,1), " Index Zero ",zeroindex," Price ",PriceZero,"  ",body[1,1] );
      ///-----------------------------
      double operandopen=iOpen(Symbol(),PERIOD_M1,1);
      double operandclose=iClose(Symbol(),PERIOD_M1,1);

      //----------Индикатор сложения бинарного кода с ценой зеро-----------------
      if(Maximum!=0)
        {
         restantemaximum=NormalizeDouble(Maximum*Point,5);
         resOperandMax=operandopen-restantemaximum;
         //Comment(resOperandMax," ",operandopen," ",IndexMaximum);
        }
      if(Minimum!=0)
        {
         restanteminimum=NormalizeDouble(Minimum*Point,5);
         resOperandMin=operandclose+restanteminimum;
        }

      //,"  ",NormalizeDouble(IndexMinimum*Point,5));
      //----Parte de indicador---SHORT
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

        }// Anadir excepcion de 10

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

      // ---------------------------------



      //Посмотреть какие значения возвращаются с переменных
      //В отдельную тетрадь фиксирават все возможные значения которые получаются при фильтрации поточьных данных
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


      //Print(" Bo ",Bo," Bе ",Be);

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
         //string MessageBB=" BEAR "+IntegerToString(MaxBinNumber_0,3)+" BOOL "+IntegerToString(MaxBinNumber_1,3);//Mensaje de indicador
         //TelegramSendText(apikey,chatid,MessageBB);
        }

      int Result_Compensation=compensation_1+compensation_2;
      //-----------отображение индикатора на графике
      int CompensationForGrafik=compensation_2*(-1);
      //--------------------------------------------
      //-----отрисовка индикатора на графике в отдельном окне
      //buf_1[i]=compensation_1;
      // buf_2[i]=CompensationForGrafik;

      //--------------------------------------------
      //---------------------------------------------
      if((resOperandMin==PriceZero || resOperandMax==PriceZero) && Maximum>0 && Minimum>0 && Rez_BE==0)
        {
         file_handle4=FileOpen(FileName4,FILE_READ|FILE_WRITE," ");
         if(file_handle4>0)
           {
            //---Индикатор смены направления-----
            //Индикатор запоминает последнюю смену направления базируясь на индикаторе compensation
            //Если присутсвует 0 в одном или другом индикаторе то меняется позиция в схорт или лонг

            int Bear_Z,Bool_Z;
            int Switch_L_S;
            string Text_Switch="No Data";
            Bool_Z=Maximum-MaxBinNumber_1;
            Bear_Z=MaxMinArr[IndexMinimum]+MaxBinNumber_0;
            //--------------------------------------------
            if(((Bool_Z>0 && Bear_Z==0)||(Bool_Z==0 && Bear_Z<0)) && Rez_BE==0 && one_BE>=1 && one_BE<=60)
              {
               Switch_L_S=1;//Позиция 1 означает открытие только лонговых ордеров
               //Print(Switch_L_S," bool ",Bool_Z," bear ",Bear_Z);

              }
            if(((Bool_Z<0 && Bear_Z==0)||(Bool_Z==0 && Bear_Z>0)) && Rez_BE==0 && one_BE>=1 && one_BE<=60)
              {
               Switch_L_S=2;//Позиция 2 означает открытие только шортов ордеров
               //Print(Switch_L_S," bool ",Bool_Z," bear ",Bear_Z);

              }
            if(Switch_L_S==1)
              {
               Text_Switch="Switch_L_S -- LONG";
              }
            if(Switch_L_S==2)
              {
               Text_Switch="Switch_L_S -- SHORT";
              }
            //---финкция Запись цены в Журнал Рыночьных Событий
            //---Записывается цены уровней UP5/8 i DOWSN5/8
            double Price5ForWrite=0;//Переменная для вложения цены уровня 5
            double Price8ForWrite=0;//Переменная для вложения цены уровня 8
            if(Maximum-MaxBinNumber_1==0)//В переменные влаживаю цены DOWN 5/8
              {
               Price5ForWrite=IpaintFiboLineDOWN_5;
               Price8ForWrite=IpaintFiboLineDOWN_8;
              }
            if(MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)//В переменные влаживаю цены UP 5/8
              {
               Price5ForWrite=IpaintFiboLineUP_5;
               Price8ForWrite=IpaintFiboLineUP_8;
              }

            BoolInd=NormalizeDouble((Maximum+MaxBinNumber_1)/(Minimum+MaxBinNumber_0),2);//Bool сила
            BearInd=NormalizeDouble((Minimum+MaxBinNumber_0)/(Maximum+MaxBinNumber_1),2);//Bear сила
            double SumaBoolBear=BoolInd+BearInd;
            //-----запись номера индекса в базе данных-----//
            //загружаю базу из файла в массив
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
         //--отправка второго сообщения на терминал телефона в mql4--//
         // string SendMessage2=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" "+IntegerToString(MaxMinArr[IndexMaximum]-MaxBinNumber_1)+" "+IntegerToString(MaxMinArr[IndexMinimum]+MaxBinNumber_0);
         //SendNotification(SendMessage2);
         LongShort=10;//Переменная для записи 1 или нп в массив
         if(resOperandMin==PriceZero && Maximum>0 && Minimum>0 && one_BE>=1 && one_BE<=60 && Rez_BE==0)
           {
            TextVisualIndicator="LONG";
            Alert("LONG");
            string signalgroup=IntegerToString(zeroindex);
            string Hora1=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion1=IntegerToString(ONE_BE);
            string Comp1=IntegerToString(MaxMinArr[IndexMaximum]-MaxBinNumber_1);
            string Comp2=IntegerToString(MaxMinArr[IndexMinimum]+MaxBinNumber_0);
            string message2=SYmbol+"-TIME "+Hora1+" SIGNAL NUMBER "+levelnotificacion1+" LONG "+" Comp1= "+Comp1+" Comp2= "+Comp2;
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
            string message1=SYmbol+"-TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion+" SHORT "+" Comp1= "+Comp1+" Comp2= "+Comp2;
            SendNotification(message1);
            LongShort=0;
           }
         //------Запись уравней в массив------------------------------
         //---Условие записи в автоматическом режиме.Програма записывает в массив в последний пустой индекс
         //---Ручьные дозаписи должны производится в суботу и воскресенье каждой недели

         RefreshRates();

         //-----Отправка сигналов на емаил аккаунт---------

         //---условие отправки сообщения. Большой сигнал определяет направление сигналу ++ -- служат для открытия сигнала

         if(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0 && Rez_BE==0)
           {
            LongPosition=true; //Ustanavlivaetsa znachenie tru esli poluchen signal v long
            ShortPosition=false;
           }
         if(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0 && Rez_BE==0)
           {
            ShortPosition=true; //Ustanavlivaetsa znachenie tru esli poluchen signal v short
            LongPosition=false;
           }
         //------------------------------------------------------------------------------
         if(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0 && Rez_BE==0)
           {
            ShortPosition=true; //Ustanavlivaetsa znachenie tru esli poluchen signal v long
            LongPosition=false;
           }
         if(one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0 && Rez_BE==0)
           {
            LongPosition=true; //Ustanavlivaetsa znachenie tru esli poluchen signal v short
            ShortPosition=false;
           }
         //--------------------Отправка сообщения на емаил-----------------------------------------------------

         if(LongPosition==true && ((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {
            //--Otpravka informacii na ftp
            string  subject="From Tatiana - RootDiamond - LONG SIGNAL EURUSD";       // заголовок
            string messageLong="Open Long, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"/   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageLong);
            string Curency=Symbol();
            string Hora=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency +" LONG - FOR ROOTDIAMOND, TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;
            //string message2=" ";
            //SendNotification(message1);
            TelegramSendText(apikey,chatid,message1);
            //Print(" LONG Signal Sended for RootDiamond = ",testT," if 0 send true, if  else not sended ");

           }
         if(ShortPosition==true && ((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {
            //--Otpravka informacii na ftp
            string  subject="From Tatiana - RootDiamond - SHORT SIGNAL EURUSD";       // заголовок
            string messageShort=" Open Short, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"/   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageShort);

            string Hora=TimeToString(iTime(Symbol(),0,1));
            string Curency=Symbol();
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency + " SHORT - FOR ROOTDIAMOND, TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;
            //string message2=" ";
            //SendNotification(message1);
            TelegramSendText(apikey,chatid,message1);
            // Print(" SHORT Signal Sended for RootDiamond = ",testT," if 0 send true, if  else not sended ");
           }
         //---Сигналы для RootDiamond 8-13

         if(((one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0>0)||(one_BE>15 && Maximum-MaxBinNumber_1==0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0<0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {
            //--Otpravka informacii na ftp
            string  subject="From Tatiana - RootDiamond_8 - SHORT SIGNAL EURUSD";       // заголовок
            string messageShort=" Open Short, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" FONT "+IntegerToString(one_BE,0,0)+"   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageShort);
            //string signalgroup=IntegerToString(zeroindex);
            string Curency=Symbol();
            string Hora=TimeToString(iTime(Symbol(),0,1));
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency+" SHORT - FOR ROOTDIAMOND_8 , TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;
            //string message2=" ";
            //SendNotification(message1);
            int testT=TelegramSendText(apikey,chatid,message1);
            //Print(" SHORT Signal Sended for RootDiamond_8 = ",testT," if 0 send true, if  else not sended ");

           }
         if(((one_BE>15 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>15 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)) && Rez_BE==0)//||(one_BE>25 && Maximum-MaxBinNumber_1<0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)||(one_BE>25 && Maximum-MaxBinNumber_1>0 && MaxMinArr[IndexMinimum]+MaxBinNumber_0==0)
           {
            //--Otpravka informacii na ftp
            string  subject="From Tatiana - RootDiamond_8 - LONG SIGNAL EURUSD";       // заголовок
            string messageLong="Open Long, "+" Simbol "+Symbol()+" Time "+TimeToString(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+" LEVEL "+IntegerToString(one_BE,0,0)+"   DONATE PLEASE FOR UPDATE PROJECT http://paypal.me/mql4Root ";

            SendMail(subject,messageLong);

            string Hora=TimeToString(iTime(Symbol(),0,1));
            string Curency=Symbol();
            string levelnotificacion=IntegerToString(ONE_BE);
            string message1=Curency+" LONG - FOR ROOTDIAMOND_8 , TIME "+Hora+" SIGNAL NUMBER "+levelnotificacion;
            //string message2=" ";
            //SendNotification(message1);
            //int testT=TelegramSendText(apikey,chatid,message1);
            //Print(" LONG Signal Sended for RootDiamond = ",testT," if 0 send true, if  else not sended ");

           }


         //---------------
         //---Отправка значений на телеграмм
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

         //---Подаваемые значения------
         if(one_BE>0 && Rez_BE==0)
           {
            //---загрузка базы данных при инициализации---
            int file_handle6=FileOpen(FileName6,FILE_READ|FILE_BIN);
            if(file_handle6>0)
              {

               FileSeek(file_handle6,0,SEEK_CUR);
               FileReadArray(file_handle6,bodydt,0,WHOLE_ARRAY);
               FileClose(file_handle6);
              }
            //загружаю базу из файла в массив
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
            //--------Ручьная запись- Тикеты Профит Лосс----------
            //bodyAR[iar,31]=;//Тикеты
            //bodyAR[iar,32]=;//Профит Лосс
            // -- после ращета присваиваю данные в массив и пишу в дб
            //Comment(" Informacion added to Array y DB ");


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

         //----Запись  Массва  в Бинарный фаил всех показателей.
         //----Каждую минутную сессию в массивы пишу время и данные с использаванием индекса.
         for(i=1; i<7205; i++)
           {
            if(AllAnalisysData[i,1]==1000)//получаю индекс заполненного элемента
              {
               break;
              }

           }

         DT_AllAnalisysData[i,0]=iTime(Symbol(),0,1);//Записываю по индексу массива время свечи

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


         //if(DayOfWeek()==5 && (TimeCurrent()>=D'23:45:00') && (TimeCurrent()<=D'23:46:00'))
         //{
         //Print(AllAnalisysData[i,14]);
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

   if(Bar_Tm==0 && time_BR==Time[0])/*Åñëè âðåìÿ áàðà ðàâåí 0 È ïåðåìííàÿ ïîëó÷èëà îòêðûòèå ñâå÷è*/
     {
      Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrWhite);
      return(0);
     }

   if(Bar_Tm!=Time[0]) /*Åñëî áàð ÒÌ íå ðàâåí  îòêðûòèå ñå÷è*/
     {

      Bar_Tm=Time[0];
      string File_Name_Close=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+"-"+SYmbol+FR_Nm;
      int replacedC=StringReplace(File_Name_Close,":"," ");
      FileClose(replacedC);
      filename=TimeToStr(iTime(Symbol(),0,1),TIME_DATE|TIME_MINUTES)+"-"+SYmbol+FR_Nm;//Nombre del archivo que se guarda en la carpeta
      string terminal_data_path=TerminalInfoString(TERMINAL_DATA_PATH); //la path de la terminal
      File_Name=terminal_data_path+"\\MQL4\\Files\\digitscandlesALL\\"+filename;

      int replaced=StringReplace(File_Name,":"," ");
      File_Name=DoubleToStr(Bar_Tm/60,0)+FR_Nm; /*ïàðàìåòð âðåìåíè*/
      Str_Pr_Bar=Bid;
      Handle=FileOpen(File_Name_Close,FILE_CSV|FILE_WRITE,";");
     }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   Bars_Z(Bid);//Здесь можно заменить на Ask и получать другие значения
   Text_OBJ_LABEL("Tx_FM",1,1,50,"l",28,"Wingdings",clrOrange);

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Bars_Z(double iBid)//Играем в Кафетерий
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
         Counter1++;/*----Êîä îò Åâãåíèÿ----*/
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
         Counter0++;/*----Êîä îò Åâãåíèÿ----*/
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
      Counter1_1++;/*----Êîä îò Åâãåíèÿ----*/
     }
   else
     {
      body [Counter,1]=0;
      body [Counter,2]=0;
      //body [Counter,4]=TimeCurrent();//Записываю время тика.
      //bintoarr[IFb1,IFb2]=0;//пишу тик в бинарной интерпретации
      //bintoarrBID[IFb1,IFb2]=Bid;//пишу цену для тика

      Counter0_1++;/*----Êîä îò Åâãåíèÿ----*/
     }
   body [Counter,0]=iBid;
   body [Counter,3]=111;
//body [Counter,4]=TimeCurrent();//Записываю время тика.p
// body [Counter,4]=Open[0];
// body [Counter,5]=High[0];
// body [Counter,6]=Low[0];
//body[Counter,7]=iTime(Symbol(),PERIOD_CURRENT,0);
//Comment(bintoarr[IFb1,2]);//Мониторинг полученных данных в массив
   FileWrite(Handle,body[Counter,0],body[Counter,1],body[Counter,2],body[Counter,3],body[Counter,4],body[Counter,5],body[Counter,6],body[Counter,7]);
   Str_Pr_Bar=iBid;

   /*---------------Êîäû îò Åâãåíèÿ----------------*/
   Counter_Summa1 = Counter1+Counter1_1;/*Ùåò÷èê åäåíèö*/
   Counter_Summa0 = Counter0+Counter0_1;/*Ùåò÷èê íàëåé*/
//Print("bintoarr[IFb1,IFb2] ",bintoarr[IFb1,IFb2]," IFb1 ",IFb1," IFb2 ",IFb2);//мониторинг записи в массив
//IFb2++;//Увеличивание значения индекса на 1 для записи в строку следующего параметра начало отщёта равно 0



  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void deinit()
  {





//-------------------------------------------------------------------------
//---
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
//|                void op_MasD()                                    |
//+------------------------------------------------------------------+
//int MasD[500,3];
//int Z_N=499;
//int Ch_M=0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void op_MasD(int Cc_1,int Cc_0)
//  {
// Ch_M++;
// MasD[Z_N,0]=(int)Time[1];
// MasD[Z_N,1]=Cc_1;
// MasD[Z_N,2]=Cc_0;
// Z_N--;
// if(Z_N<0)
//  {
//  Z_N+=1;
// for(int qt=499; qt>1; qt--)
//   {
//   MasD[qt,0]=MasD[qt-1,0];
//   MasD[qt,1]=MasD[qt-1,1];
//   MasD[qt,2]=MasD[qt-1,2];
// }
//  MasD[0,0]=0;
//  MasD[0,1]=0;
//  MasD[0,2]=0;
// }
/**/
//}
/**/
//+------------------------------------------------------------------+


