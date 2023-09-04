//+------------------------------------------------------------------+
//|                                                    ArrayTest.mq4 |
//|                                             Yevheniy Kopanitskyy |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Yevheniy Kopanitskyy"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
string SYmbol=Symbol();
string FileName18="EURUSDCupolPat1.bin";//Фаил отгрузки и загрузки
double Form_Patern_Finder[1001,120];//Массив для отслеживания формации Патернов на купольной архитектуре
datetime DT_Form_Patern_Finder[1001,120];
string FileName1=" MEMORYArray.txt";
string FileName10=SYmbol+"DT_CupolPat1.bin";

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   ArrayInitialize(Form_Patern_Finder,0);
   
   int file_handle25=FileOpen(FileName18,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   
   if(file_handle25>0)
     {

      FileSeek(file_handle25,0,SEEK_CUR);

      uint test=FileReadArray(file_handle25,Form_Patern_Finder,0,WHOLE_ARRAY);
      
      FileClose(file_handle25);
     }
      int file_handle26=FileOpen(FileName10,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   
   if(file_handle26>0)
     {

      FileSeek(file_handle26,0,SEEK_CUR);

      uint test=FileReadArray(file_handle26,DT_Form_Patern_Finder,0,WHOLE_ARRAY);
      
      FileClose(file_handle26);
     }

   int file_handle17=FileOpen(FileName1,FILE_READ|FILE_WRITE," ");
   if(file_handle17>0)
     {

      FileSeek(file_handle17,0,SEEK_END);

      for(int i=1; i<1000; i++)
        {

         FileWrite(file_handle17," ------------BE_0-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,1]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,1]);
         FileWrite(file_handle17,Form_Patern_Finder[i,2]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,2]);
         FileWrite(file_handle17,Form_Patern_Finder[i,3]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,3]);
         FileWrite(file_handle17,Form_Patern_Finder[i,4]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,4]);
         FileWrite(file_handle17,Form_Patern_Finder[i,5]);
         FileWrite(file_handle17,Form_Patern_Finder[i,6]);
         FileWrite(file_handle17,Form_Patern_Finder[i,7]);
         FileWrite(file_handle17,Form_Patern_Finder[i,8]);
         FileWrite(file_handle17,Form_Patern_Finder[i,9]);
         FileWrite(file_handle17,Form_Patern_Finder[i,10]);
         FileWrite(file_handle17,Form_Patern_Finder[i,11]);
         FileWrite(file_handle17,Form_Patern_Finder[i,12]);
         FileWrite(file_handle17,Form_Patern_Finder[i,13]);
         FileWrite(file_handle17,Form_Patern_Finder[i,14]);
         FileWrite(file_handle17,Form_Patern_Finder[i,15]);
         FileWrite(file_handle17," --------------------------------");
          FileWrite(file_handle17," ------------Bo_0-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,16]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,16]);
         FileWrite(file_handle17,Form_Patern_Finder[i,17]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,17]);
         FileWrite(file_handle17,Form_Patern_Finder[i,18]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,18]);
         FileWrite(file_handle17,Form_Patern_Finder[i,19]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,19]);
         FileWrite(file_handle17,Form_Patern_Finder[i,20]);
         FileWrite(file_handle17,Form_Patern_Finder[i,21]);
         FileWrite(file_handle17,Form_Patern_Finder[i,22]);
         FileWrite(file_handle17,Form_Patern_Finder[i,23]);
         FileWrite(file_handle17,Form_Patern_Finder[i,24]);
         FileWrite(file_handle17,Form_Patern_Finder[i,25]);
         FileWrite(file_handle17,Form_Patern_Finder[i,25]);
         FileWrite(file_handle17,Form_Patern_Finder[i,27]);
         FileWrite(file_handle17,Form_Patern_Finder[i,28]);
         FileWrite(file_handle17,Form_Patern_Finder[i,29]);
         FileWrite(file_handle17,Form_Patern_Finder[i,30]);
         FileWrite(file_handle17," --------------------------------");
         FileWrite(file_handle17," ------------Be_1-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,31]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,31]);
         FileWrite(file_handle17,Form_Patern_Finder[i,32]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,32]);
         FileWrite(file_handle17,Form_Patern_Finder[i,33]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,33]);
         FileWrite(file_handle17,Form_Patern_Finder[i,34]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,34]);
         FileWrite(file_handle17,Form_Patern_Finder[i,35]);
         FileWrite(file_handle17,Form_Patern_Finder[i,36]);
         FileWrite(file_handle17,Form_Patern_Finder[i,37]);
         FileWrite(file_handle17,Form_Patern_Finder[i,38]);
         FileWrite(file_handle17,Form_Patern_Finder[i,39]);
         FileWrite(file_handle17,Form_Patern_Finder[i,40]);
         FileWrite(file_handle17,Form_Patern_Finder[i,41]);
         FileWrite(file_handle17,Form_Patern_Finder[i,42]);
         FileWrite(file_handle17,Form_Patern_Finder[i,43]);
         FileWrite(file_handle17,Form_Patern_Finder[i,44]);
         FileWrite(file_handle17,Form_Patern_Finder[i,45]);
         FileWrite(file_handle17," --------------------------------");
         FileWrite(file_handle17," ------------Bo_1-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,46]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,46]);
         FileWrite(file_handle17,Form_Patern_Finder[i,47]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,47]);
         FileWrite(file_handle17,Form_Patern_Finder[i,48]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,48]);
         FileWrite(file_handle17,Form_Patern_Finder[i,49]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,49]);
         FileWrite(file_handle17,Form_Patern_Finder[i,50]);
         FileWrite(file_handle17,Form_Patern_Finder[i,51]);
         FileWrite(file_handle17,Form_Patern_Finder[i,52]);
         FileWrite(file_handle17,Form_Patern_Finder[i,53]);
         FileWrite(file_handle17,Form_Patern_Finder[i,54]);
         FileWrite(file_handle17,Form_Patern_Finder[i,55]);
         FileWrite(file_handle17,Form_Patern_Finder[i,55]);
         FileWrite(file_handle17,Form_Patern_Finder[i,57]);
         FileWrite(file_handle17,Form_Patern_Finder[i,58]);
         FileWrite(file_handle17,Form_Patern_Finder[i,59]);
         FileWrite(file_handle17,Form_Patern_Finder[i,60]);
         FileWrite(file_handle17," --------------------------------");
          FileWrite(file_handle17," ------------Be_0_IZN-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,61]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,61]);
         FileWrite(file_handle17,Form_Patern_Finder[i,62]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,62]);
         FileWrite(file_handle17,Form_Patern_Finder[i,63]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,63]);
         FileWrite(file_handle17,Form_Patern_Finder[i,64]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,64]);
         FileWrite(file_handle17,Form_Patern_Finder[i,65]);
         FileWrite(file_handle17,Form_Patern_Finder[i,66]);
         FileWrite(file_handle17,Form_Patern_Finder[i,67]);
         FileWrite(file_handle17,Form_Patern_Finder[i,68]);
         FileWrite(file_handle17,Form_Patern_Finder[i,69]);
         FileWrite(file_handle17,Form_Patern_Finder[i,70]);
         FileWrite(file_handle17,Form_Patern_Finder[i,71]);
         FileWrite(file_handle17,Form_Patern_Finder[i,72]);
         FileWrite(file_handle17,Form_Patern_Finder[i,73]);
         FileWrite(file_handle17,Form_Patern_Finder[i,74]);
         FileWrite(file_handle17,Form_Patern_Finder[i,75]);
         FileWrite(file_handle17," --------------------------------");
          FileWrite(file_handle17," ------------Bo_0_IZN-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,76]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,76]);
         FileWrite(file_handle17,Form_Patern_Finder[i,77]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,77]);
         FileWrite(file_handle17,Form_Patern_Finder[i,78]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,78]);
         FileWrite(file_handle17,Form_Patern_Finder[i,79]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,79]);
         FileWrite(file_handle17,Form_Patern_Finder[i,80]);
         FileWrite(file_handle17,Form_Patern_Finder[i,81]);
         FileWrite(file_handle17,Form_Patern_Finder[i,82]);
         FileWrite(file_handle17,Form_Patern_Finder[i,83]);
         FileWrite(file_handle17,Form_Patern_Finder[i,84]);
         FileWrite(file_handle17,Form_Patern_Finder[i,85]);
         FileWrite(file_handle17,Form_Patern_Finder[i,86]);
         FileWrite(file_handle17,Form_Patern_Finder[i,87]);
         FileWrite(file_handle17,Form_Patern_Finder[i,88]);
         FileWrite(file_handle17,Form_Patern_Finder[i,89]);
         FileWrite(file_handle17,Form_Patern_Finder[i,90]);
         FileWrite(file_handle17," --------------------------------");
         FileWrite(file_handle17," ------------Be_1_IZN-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,91]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,91]);
         FileWrite(file_handle17,Form_Patern_Finder[i,92]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,92]);
         FileWrite(file_handle17,Form_Patern_Finder[i,93]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,93]);
         FileWrite(file_handle17,Form_Patern_Finder[i,94]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,94]);
         FileWrite(file_handle17,Form_Patern_Finder[i,95]);
         FileWrite(file_handle17,Form_Patern_Finder[i,96]);
         FileWrite(file_handle17,Form_Patern_Finder[i,97]);
         FileWrite(file_handle17,Form_Patern_Finder[i,98]);
         FileWrite(file_handle17,Form_Patern_Finder[i,99]);
         FileWrite(file_handle17,Form_Patern_Finder[i,100]);
         FileWrite(file_handle17,Form_Patern_Finder[i,101]);
         FileWrite(file_handle17,Form_Patern_Finder[i,102]);
         FileWrite(file_handle17,Form_Patern_Finder[i,103]);
         FileWrite(file_handle17,Form_Patern_Finder[i,104]);
         FileWrite(file_handle17,Form_Patern_Finder[i,105]);
         FileWrite(file_handle17," --------------------------------");
         FileWrite(file_handle17," ------------Be_1_IZN-----------------");
         FileWrite(file_handle17,Form_Patern_Finder[i,106]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,106]);
         FileWrite(file_handle17,Form_Patern_Finder[i,107]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,107]);
         FileWrite(file_handle17,Form_Patern_Finder[i,108]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,108]);
         FileWrite(file_handle17,Form_Patern_Finder[i,109]);
         FileWrite(file_handle17,DT_Form_Patern_Finder[i,109]);
         FileWrite(file_handle17,Form_Patern_Finder[i,110]);
         FileWrite(file_handle17,Form_Patern_Finder[i,111]);
         FileWrite(file_handle17,Form_Patern_Finder[i,112]);
         FileWrite(file_handle17,Form_Patern_Finder[i,113]);
         FileWrite(file_handle17,Form_Patern_Finder[i,114]);
         FileWrite(file_handle17,Form_Patern_Finder[i,115]);
         FileWrite(file_handle17,Form_Patern_Finder[i,116]);
         FileWrite(file_handle17,Form_Patern_Finder[i,117]);
         FileWrite(file_handle17,Form_Patern_Finder[i,118]);
         FileWrite(file_handle17,Form_Patern_Finder[i,119]);
         FileWrite(file_handle17,Form_Patern_Finder[i,120]);
         FileWrite(file_handle17," --------------------------------");
         
         
        }


      FileClose(file_handle17);
     }
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---


  }
//+------------------------------------------------------------------+
