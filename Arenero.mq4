//+------------------------------------------------------------------+
//|                                                  PipaGirando.mq4 |
//|                             Copyright 2022, Yevheniy Kopanitskyy |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, Yevheniy Kopanitskyy"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int SEV=1;
int YUG=1;
int ZAP=1;
int VOST=1;
double HIGHT;
datetime BrTime;
long CHWPX;
datetime time_bar;
string RectanglLabel="703";
datetime bar_time=D'2018.08.06 00:00';
string Text_Space_1=" Ejemplo de Texto ";
ushort CharacterGet;
string Text_Space_2;
string Text_Space_3;
string Play="203";
string ObiektTe="2001";
string TextSpace="202";
string TextSpace_2="200";
string TextSpace_3="199";
int LetraCorriente=-1;
string PosLetra;
string Delante="206";
string Atras="207";
string Write="208";
string J_1="209";
string J_2="210";
string J_3="211";
string J_4="212";
string J_Simple="213";
string J_Complejo="214";
string J_Sleep="215";
string obiektT="216";
string brts="3000";
int Game_Direction=0;
int LetSimbEN[9999,20];
string CharLetra;
string FileName1="Letras_EN.bin";
bool ShowSimb=false;
string obiekt1001;
int Juego=0;
string   Kubo_Img1,Kubo_Img2,Kubo_Img5,Kubo_Img6,Kubo_Img3,Kubo_Img4,Kubo_Img7,Kubo_Img8,Kubo_Img9,Kubo_Img10;
string   Kubo_Img13,Kubo_Img14,Kubo_Img11,Kubo_Img12,Kubo_Img15,Kubo_Img16,Kubo_ImgZERO;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//Загрузка массива с буквами
   ArrayInitialize(LetSimbEN,0);
   int file_handle1=FileOpen(FileName1,FILE_READ|FILE_WRITE|FILE_BIN);//Loading
   Print(" Letras_EN ",file_handle1);
   if(file_handle1>0)
     {

      FileSeek(file_handle1,0,SEEK_CUR);

      uint test=FileReadArray(file_handle1,LetSimbEN,0,WHOLE_ARRAY);
      FileClose(file_handle1);
     }
//Последняя пустая позиция
   for(int Bi=1; Bi<9998; Bi++)
     {
      Print(" Fila ",Bi," Contenido de celda ",LetSimbEN[Bi,10]);//Печать наличия в массиве
      if(LetSimbEN[Bi,0]==0)
        {
         Print(" Numero de Fila Libre ",Bi);
         break;
        }

     }


   CHWPX=-1;
   ChartGetInteger(0,CHART_WIDTH_IN_PIXELS,0,CHWPX);
//--- create timer

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
   ChartSetInteger(0,CHART_COLOR_BID,clrBlue);
   EventSetTimer(60);


//-----обиект прямоугольное окно
   ObjectCreate(0,RectanglLabel,OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_XDISTANCE,CHWPX-1300);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_YDISTANCE,0);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_XSIZE,CHWPX-300);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_YSIZE,700);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_BGCOLOR,clrBlueViolet);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_BORDER_TYPE,BORDER_SUNKEN);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_COLOR,clrBlack);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_STYLE,DRAW_SECTION);
   ObjectSetInteger(0,RectanglLabel,OBJPROP_WIDTH,10);


//------Поле ввода Текста----



   ObjectCreate(ObiektTe,OBJ_EDIT,0,BrTime,HIGHT+0.00015);//Создание Поля ввода для текста
   ObjectSetInteger(0,ObiektTe,OBJPROP_XDISTANCE,CHWPX-1300);//Устанавливается дистанция по оси X 300 пикселей
   ObjectSetInteger(0,ObiektTe,OBJPROP_YDISTANCE,0);//Устанавливается дистанция по оси Y 0 пикселей
   ObjectSetInteger(0,ObiektTe,OBJPROP_XSIZE,1200);//Устанавливается размер поля по оси икс в 120 пикселей
   ObjectSetInteger(0,ObiektTe,OBJPROP_YSIZE,40);//Устанавливается размер поля по оси игрик в 20 пикселей
   ObjectSetInteger(0,ObiektTe,OBJPROP_ALIGN,ALIGN_CENTER);//Устанавливается значение центровка текста на уравень центра
   ObjectSetInteger(0,ObiektTe,OBJPROP_COLOR,clrRed);//Обьект поле получает красный цвет
//--- установим текст
   string TextInit="introdusca texto para ejecutar el jego, texto en minuscula";//Установка текста в поле
   ObjectSetString(0,ObiektTe,OBJPROP_TEXT,TextInit);
//--- Вывод 1 Текста


   ObjectDelete(TextSpace);
   ObjectCreate(TextSpace,OBJ_LABEL,0,BrTime,HIGHT+0.00015);
   ObjectSetString(0,TextSpace,OBJPROP_TEXT,Text_Space_1);
   ObjectSetInteger(0,TextSpace,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,TextSpace,OBJPROP_FONTSIZE,16);
   ObjectSetInteger(0,TextSpace,OBJPROP_XDISTANCE,CHWPX-1300);
   ObjectSetInteger(0,TextSpace,OBJPROP_YDISTANCE,80);
   ObjectSetInteger(0,TextSpace,OBJPROP_ALIGN,ALIGN_CENTER);//Устанавливается значение центровка текста на уравень центра
   ObjectSetInteger(0,TextSpace,OBJPROP_COLOR,clrBlack);

//--- Вывод 2 Текста


   ObjectDelete(TextSpace_2);
   ObjectCreate(TextSpace_2,OBJ_LABEL,0,BrTime,HIGHT+0.00015);
   ObjectSetString(0,TextSpace_2,OBJPROP_TEXT,Text_Space_2);
   ObjectSetInteger(0,TextSpace_2,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,TextSpace_2,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,TextSpace_2,OBJPROP_XDISTANCE,CHWPX-1300);
   ObjectSetInteger(0,TextSpace_2,OBJPROP_YDISTANCE,120);
   ObjectSetInteger(0,TextSpace_2,OBJPROP_ALIGN,ALIGN_CENTER);//Устанавливается значение центровка текста на уравень центра
   ObjectSetInteger(0,TextSpace_2,OBJPROP_COLOR,clrBlack);

//--- Вывод 3 Текста


   ObjectDelete(TextSpace_3);
   ObjectCreate(TextSpace_3,OBJ_LABEL,0,BrTime,HIGHT+0.00015);
   ObjectSetString(0,TextSpace_3,OBJPROP_TEXT,Text_Space_3);
   ObjectSetInteger(0,TextSpace_3,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,TextSpace_3,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,TextSpace_3,OBJPROP_XDISTANCE,CHWPX-1300);
   ObjectSetInteger(0,TextSpace_3,OBJPROP_YDISTANCE,160);
   ObjectSetInteger(0,TextSpace_3,OBJPROP_ALIGN,ALIGN_CENTER);//Устанавливается значение центровка текста на уравень центра
   ObjectSetInteger(0,TextSpace_3,OBJPROP_COLOR,clrBlack);

//--Play Button--------------------

   ObjectDelete(Play);
   ObjectCreate(0,Play,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Play,OBJPROP_XDISTANCE,CHWPX-90);
   ObjectSetInteger(0,Play,OBJPROP_YDISTANCE,0);
   ObjectSetInteger(0,Play,OBJPROP_XSIZE,60);
   ObjectSetInteger(0,Play,OBJPROP_YSIZE,40);
   string textPlay="Play";
   ObjectSetString(0,Play,OBJPROP_TEXT,textPlay);
   ObjectSetInteger(0,Play,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Play,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Play,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Playstate=false;
   ObjectSetInteger(0,Play,OBJPROP_STATE,Playstate);
//long Playbuttonpresed=ObjectGetInteger(0,Play,OBJPROP_STATE,0);

//--Game 1 Button--------------------
   string Game_1="204";
   ObjectDelete(Game_1);
//ObjectCreate(0,Game_1,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Game_1,OBJPROP_XDISTANCE,CHWPX-120);
   ObjectSetInteger(0,Game_1,OBJPROP_YDISTANCE,80);
   ObjectSetInteger(0,Game_1,OBJPROP_XSIZE,100);
   ObjectSetInteger(0,Game_1,OBJPROP_YSIZE,40);
   string textGame_1="Game 1";
   ObjectSetString(0,Game_1,OBJPROP_TEXT,textGame_1);
   ObjectSetInteger(0,Game_1,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Game_1,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Game_1,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Game_1state=false;
   ObjectSetInteger(0,Game_1,OBJPROP_STATE,Game_1state);
//long Game_1buttonpresed=ObjectGetInteger(0,Game_1,OBJPROP_STATE,0);

//--Game 2 Button--------------------
   string Game_2="205";
   ObjectDelete(Game_2);
//ObjectCreate(0,Game_2,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Game_2,OBJPROP_XDISTANCE,CHWPX-240);
   ObjectSetInteger(0,Game_2,OBJPROP_YDISTANCE,80);
   ObjectSetInteger(0,Game_2,OBJPROP_XSIZE,100);
   ObjectSetInteger(0,Game_2,OBJPROP_YSIZE,40);
   string textGame_2="Game 2";
   ObjectSetString(0,Game_2,OBJPROP_TEXT,textGame_2);
   ObjectSetInteger(0,Game_2,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Game_2,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Game_2,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Game_2state=false;
   ObjectSetInteger(0,Game_2,OBJPROP_STATE,Game_2state);
//long Game_2buttonpresed=ObjectGetInteger(0,Game_2,OBJPROP_STATE,0);

//--Delante Button--------------------

   ObjectDelete(Delante);
   ObjectCreate(0,Delante,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Delante,OBJPROP_XDISTANCE,CHWPX-540);
   ObjectSetInteger(0,Delante,OBJPROP_YDISTANCE,140);
   ObjectSetInteger(0,Delante,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,Delante,OBJPROP_YSIZE,40);
   string textDelante="Delante ->>";
   ObjectSetString(0,Delante,OBJPROP_TEXT,textDelante);
   ObjectSetInteger(0,Delante,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Delante,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Delante,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Delantestate=false;
   ObjectSetInteger(0,Delante,OBJPROP_STATE,Delantestate);
//long Delantebuttonpresed=ObjectGetInteger(0,Delante,OBJPROP_STATE,0);
//--Atras Button--------------------

   ObjectDelete(Atras);
   ObjectCreate(0,Atras,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Atras,OBJPROP_XDISTANCE,CHWPX-840);
   ObjectSetInteger(0,Atras,OBJPROP_YDISTANCE,140);
   ObjectSetInteger(0,Atras,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,Atras,OBJPROP_YSIZE,40);
   string textAtras="<<- Atras";
   ObjectSetString(0,Atras,OBJPROP_TEXT,textAtras);
   ObjectSetInteger(0,Atras,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Atras,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Atras,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Atrasstate=false;
   ObjectSetInteger(0,Atras,OBJPROP_STATE,Atrasstate);
//long Atrasbuttonpresed=ObjectGetInteger(0,Atras,OBJPROP_STATE,0);
//--Write Button--------------------

   ObjectDelete(Write);
   //ObjectCreate(0,Write,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,Write,OBJPROP_XDISTANCE,CHWPX-685);
   ObjectSetInteger(0,Write,OBJPROP_YDISTANCE,190);
   ObjectSetInteger(0,Write,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,Write,OBJPROP_YSIZE,40);
   string textWrite=" Write ";
   ObjectSetString(0,Write,OBJPROP_TEXT,textWrite);
   ObjectSetInteger(0,Write,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,Write,OBJPROP_FONTSIZE,14);
   ObjectSetInteger(0,Write,OBJPROP_ALIGN,ALIGN_CENTER);
   bool Writestate=false;
   ObjectSetInteger(0,Write,OBJPROP_STATE,Writestate);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--J1--------------------

   ObjectDelete(J_1);//Sev - 1,Yug -2 ,Vost - 3, Zap - 4
   ObjectCreate(0,J_1,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_1,OBJPROP_XDISTANCE,CHWPX-285);
   ObjectSetInteger(0,J_1,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_1,OBJPROP_XSIZE,40);
   ObjectSetInteger(0,J_1,OBJPROP_YSIZE,40);
   string textJ_1=" NORTE ";
   ObjectSetString(0,J_1,OBJPROP_TEXT,textJ_1);
   ObjectSetInteger(0,J_1,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_1,OBJPROP_FONTSIZE,6);
   ObjectSetInteger(0,J_1,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_1state=false;
   ObjectSetInteger(0,J_1,OBJPROP_STATE,J_1state);
//long Writebuttonpresed=ObjectGetInteger(0,WriteOBJPROP_STATE,0);
//--J2--------------------

   ObjectDelete(J_2);//Sev - 1,Yug -2 ,Vost - 3, Zap - 4
   ObjectCreate(0,J_2,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_2,OBJPROP_XDISTANCE,CHWPX-225);
   ObjectSetInteger(0,J_2,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_2,OBJPROP_XSIZE,40);
   ObjectSetInteger(0,J_2,OBJPROP_YSIZE,40);
   string textJ_2=" SUR ";
   ObjectSetString(0,J_2,OBJPROP_TEXT,textJ_2);
   ObjectSetInteger(0,J_2,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_2,OBJPROP_FONTSIZE,6);
   ObjectSetInteger(0,J_2,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_2state=false;
   ObjectSetInteger(0,J_2,OBJPROP_STATE,J_2state);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--J3--------------------

   ObjectDelete(J_3);//Sev - 1,Yug -2 ,Vost - 3, Zap - 4
   ObjectCreate(0,J_3,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_3,OBJPROP_XDISTANCE,CHWPX-165);
   ObjectSetInteger(0,J_3,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_3,OBJPROP_XSIZE,50);
   ObjectSetInteger(0,J_3,OBJPROP_YSIZE,40);
   string textJ_3=" ESTE ";
   ObjectSetString(0,J_3,OBJPROP_TEXT,textJ_3);
   ObjectSetInteger(0,J_3,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_3,OBJPROP_FONTSIZE,6);
   ObjectSetInteger(0,J_3,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_3state=false;
   ObjectSetInteger(0,J_3,OBJPROP_STATE,J_3state);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--J4--------------------

   ObjectDelete(J_4);//Sev - 1,Yug -2 ,Vost - 3, Zap - 4
   ObjectCreate(0,J_4,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_4,OBJPROP_XDISTANCE,CHWPX-105);
   ObjectSetInteger(0,J_4,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_4,OBJPROP_XSIZE,40);
   ObjectSetInteger(0,J_4,OBJPROP_YSIZE,40);
   string textJ_4=" OESTE ";
   ObjectSetString(0,J_4,OBJPROP_TEXT,textJ_4);
   ObjectSetInteger(0,J_4,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_4,OBJPROP_FONTSIZE,6);
   ObjectSetInteger(0,J_4,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_4state=false;
   ObjectSetInteger(0,J_4,OBJPROP_STATE,J_4state);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--Complejo--------------------

   ObjectDelete(J_Complejo);
   ObjectCreate(0,J_Complejo,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_Complejo,OBJPROP_XDISTANCE,CHWPX-435);
   ObjectSetInteger(0,J_Complejo,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_Complejo,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,J_Complejo,OBJPROP_YSIZE,40);
   string textJ_Complejo=" Juego Complejo ";
   ObjectSetString(0,J_Complejo,OBJPROP_TEXT,textJ_Complejo);
   ObjectSetInteger(0,J_Complejo,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_Complejo,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,J_Complejo,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_Complejostate=false;
   ObjectSetInteger(0,J_Complejo,OBJPROP_STATE,J_Complejostate);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--Simple--------------------

   ObjectDelete(J_Simple);
   ObjectCreate(0,J_Simple,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_Simple,OBJPROP_XDISTANCE,CHWPX-585);
   ObjectSetInteger(0,J_Simple,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_Simple,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,J_Simple,OBJPROP_YSIZE,40);
   string textJ_Simple=" Juego Simple ";
   ObjectSetString(0,J_Simple,OBJPROP_TEXT,textJ_Simple);
   ObjectSetInteger(0,J_Simple,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_Simple,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,J_Simple,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_Simplestate=false;
   ObjectSetInteger(0,J_Simple,OBJPROP_STATE,J_Simplestate);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
//--Simple--------------------

   ObjectDelete(J_Sleep);
   ObjectCreate(0,J_Sleep,OBJ_BUTTON,0,bar_time,HIGHT+0.00015);
   ObjectSetInteger(0,J_Sleep,OBJPROP_XDISTANCE,CHWPX-735);
   ObjectSetInteger(0,J_Sleep,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,J_Sleep,OBJPROP_XSIZE,140);
   ObjectSetInteger(0,J_Sleep,OBJPROP_YSIZE,40);
   string textJ_Sleep=" Sleep Time ";
   ObjectSetString(0,J_Sleep,OBJPROP_TEXT,textJ_Sleep);
   ObjectSetInteger(0,J_Sleep,OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,J_Sleep,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,J_Sleep,OBJPROP_ALIGN,ALIGN_CENTER);
   bool J_Sleep=false;
   ObjectSetInteger(0,J_Sleep,OBJPROP_STATE,J_Sleep);
//long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);

//------Поле ввода Времени----
   ObjectDelete(obiektT);
   ObjectCreate(obiektT,OBJ_EDIT,0,BrTime,HIGHT+0.00015);
   ObjectSetInteger(0,obiektT,OBJPROP_XDISTANCE,CHWPX-845);
   ObjectSetInteger(0,obiektT,OBJPROP_YDISTANCE,60);
   ObjectSetInteger(0,obiektT,OBJPROP_XSIZE,100);
   ObjectSetInteger(0,obiektT,OBJPROP_YSIZE,40);
   ObjectSetInteger(0,obiektT,OBJPROP_ALIGN,ALIGN_CENTER);
   ObjectSetInteger(0,obiektT,OBJPROP_COLOR,clrRed);
//--- установим текст 
   
   ObjectSetString(0,obiektT,OBJPROP_TEXT,brts);

//-------imag Kubo-----

//-------imag Kubo-Game----
   Kubo_Img1="\\Images\\Class-Kubo-16-img\\1.bmp";
   Kubo_Img2="\\Images\\Class-Kubo-16-img\\2.bmp";
   Kubo_Img5="\\Images\\Class-Kubo-16-img\\5.bmp";
   Kubo_Img6="\\Images\\Class-Kubo-16-img\\6.bmp";
   Kubo_Img3="\\Images\\Class-Kubo-16-img\\3.bmp";
   Kubo_Img4="\\Images\\Class-Kubo-16-img\\4.bmp";
   Kubo_Img7="\\Images\\Class-Kubo-16-img\\7.bmp";
   Kubo_Img8="\\Images\\Class-Kubo-16-img\\8.bmp";
   Kubo_Img9="\\Images\\Class-Kubo-16-img\\9.bmp";
   Kubo_Img10="\\Images\\Class-Kubo-16-img\\10.bmp";
   Kubo_Img13="\\Images\\Class-Kubo-16-img\\13.bmp";
   Kubo_Img14="\\Images\\Class-Kubo-16-img\\14.bmp";
   Kubo_Img11="\\Images\\Class-Kubo-16-img\\11.bmp";
   Kubo_Img12="\\Images\\Class-Kubo-16-img\\12.bmp";
   Kubo_Img15="\\Images\\Class-Kubo-16-img\\15.bmp";
   Kubo_Img16="\\Images\\Class-Kubo-16-img\\16.bmp";
   Kubo_ImgZERO="\\Images\\Class-Kubo-16-img\\ZERO.bmp";
//-----------------------
   obiekt1001="1001";
   ObjectDelete(0,obiekt1001);
   ObjectDelete(obiekt1001);
   ObjectCreate(obiekt1001,OBJ_BITMAP_LABEL,0,BrTime,HIGHT+0.00015);
   ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,Kubo_ImgZERO);
   ObjectSetInteger(0,obiekt1001,OBJPROP_XDISTANCE,1600);
   ObjectSetInteger(0,obiekt1001,OBJPROP_YDISTANCE,130);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//if(time_bar!=Time[0])// Body area containing binary code analyzers
//{
   HIGHT=iHigh(Symbol(),0,1);
   BrTime=iTime(Symbol(),0,1);

//----
//time_bar=Time[0];
//---








//--------Play Button 1-----//
   string IgetText;
   long Playbuttonpresed=ObjectGetInteger(0,Play,OBJPROP_STATE,0);
   if(Playbuttonpresed==1)
     {


      IgetText=ObjectGetString(0,ObiektTe,OBJPROP_TEXT);
      ObjectSetString(0,TextSpace,OBJPROP_TEXT,IgetText);
      ObjectSetInteger(0,Play,OBJPROP_STATE,0);
      LetraCorriente=0;//Порядковый номер текущей буквы
      //string test="abcdefghigklmnopqrstuvwxyzñ ";//Начало чтения с 0 символа
      int resstrlen=StringLen(IgetText);
      Print(resstrlen);//минусуется последний символ так как является пустым
      int resstrlen1=resstrlen;
      string stresstrlen1=IntegerToString(resstrlen1);
      CharacterGet=StringGetCharacter(IgetText,LetraCorriente);//Пробел цифра 32
      Print(" Character 0 - ",CharacterGet);
      ObjectSetString(0,TextSpace_2,OBJPROP_TEXT,"Cantidad de Letras Total = a "+stresstrlen1);
      CharLetra=CharToStr(CharacterGet);
      //Game_Direction=1;//Начало игры всегда с севера
      //Print(" Letra - ",CharLetra);
      //спарсить весьнабор букв в циферном значении

      string stLetraCorriente=IntegerToString(LetraCorriente+1);
      ObjectSetString(0,TextSpace_3,OBJPROP_TEXT,"Letra actual =[  "+CharLetra+ " ] Y Posicion de letra en texto = a [ "+stLetraCorriente+" ]");
      ShowSimb=true;
     }
//--------Delante Button 1-----//

   long Delantebuttonpresed=ObjectGetInteger(0,Delante,OBJPROP_STATE,0);
   if(Delantebuttonpresed==1)
     {
      LetraCorriente++;//Присваем Номер текущей цифры
      Print("Delante Letra N ",LetraCorriente);
      IgetText=ObjectGetString(0,ObiektTe,OBJPROP_TEXT);
      CharacterGet=StringGetCharacter(IgetText,LetraCorriente);//Пробел цифра 32
      CharLetra=CharToStr(CharacterGet);

      string stLetraCorriente=IntegerToString(LetraCorriente+1);
      ObjectSetString(0,TextSpace_3,OBJPROP_TEXT,"Letra actual =[  "+CharLetra+ " ] Y Posicion de letra en texto = a [ "+stLetraCorriente+" ]");
      ObjectSetInteger(0,Delante,OBJPROP_STATE,0);
      //Подача номера Буквы
      ShowSimb=true;



     }
   long Atrasbuttonpresed=ObjectGetInteger(0,Atras,OBJPROP_STATE,0);
   if(Atrasbuttonpresed==1)
     {

      LetraCorriente--;//Присваем Номер текущей цифры
      Print("Atras Letra N ",LetraCorriente);
      IgetText=ObjectGetString(0,ObiektTe,OBJPROP_TEXT);

      CharacterGet=StringGetCharacter(IgetText,LetraCorriente);//Пробел цифра 32
      CharLetra=CharToStr(CharacterGet);
      string stLetraCorriente=IntegerToString(LetraCorriente+1);
      ObjectSetString(0,TextSpace_3,OBJPROP_TEXT,"Letra actual =[  "+CharLetra+ " ] Y Posicion de letra en texto = a [ "+stLetraCorriente+" ]");
      ObjectSetInteger(0,Atras,OBJPROP_STATE,0);
      //Подача номера Буквы

      ShowSimb=true;


     }

   long J_Simplepresed=ObjectGetInteger(0,J_Simple,OBJPROP_STATE,0);
   if(J_Simplepresed==1)
     {
      Juego=1;//Ejecucion del modo Simple

      ObjectSetInteger(0,J_Simple,OBJPROP_STATE,0);

     }

   long J_Complejopresed=ObjectGetInteger(0,J_Complejo,OBJPROP_STATE,0);
   if(J_Complejopresed==1)
     {
      Juego=2;//Ejecucion del modo complejo

      ObjectSetInteger(0,J_Complejo,OBJPROP_STATE,0);

     }

   long J_1presed=ObjectGetInteger(0,J_1,OBJPROP_STATE,0);
   if(J_1presed==1)
     {
      Game_Direction=1;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4

      ObjectSetInteger(0,J_1,OBJPROP_STATE,0);

     }
   long J_2presed=ObjectGetInteger(0,J_2,OBJPROP_STATE,0);
   if(J_2presed==1)
     {
      Game_Direction=2;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4

      ObjectSetInteger(0,J_2,OBJPROP_STATE,0);

     }
   long J_3presed=ObjectGetInteger(0,J_3,OBJPROP_STATE,0);
   if(J_3presed==1)
     {
      Game_Direction=3;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4

      ObjectSetInteger(0,J_3,OBJPROP_STATE,0);

     }
     long J_4presed=ObjectGetInteger(0,J_4,OBJPROP_STATE,0);
   if(J_4presed==1)
     {
      Game_Direction=4;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4

      ObjectSetInteger(0,J_4,OBJPROP_STATE,0);

     }
      long J_sleep=ObjectGetInteger(0,J_Sleep,OBJPROP_STATE,0);
   if(J_sleep==1)
     {
        brts=ObjectGetString(0,obiektT,OBJPROP_TEXT);
        ObjectSetInteger(0,J_Sleep,OBJPROP_STATE,0);

     }

   int i;
   long Writebuttonpresed=ObjectGetInteger(0,Write,OBJPROP_STATE,0);
   if(Writebuttonpresed==1)
     {

      ObjectSetInteger(0,Write,OBJPROP_STATE,0);
      //Запись Данных в Массив


      //Записываем Изображения семечки 8 бит
      i=4;//Номер строки

      LetSimbEN[i,0]=8;//Bit 1
      LetSimbEN[i,1]=16;//Bit 2
      LetSimbEN[i,2]=7;//Bit 3
      LetSimbEN[i,3]=15;//Bit 4
      LetSimbEN[i,4]=1;//Bit 5
      LetSimbEN[i,5]=9;//Bit 6
      LetSimbEN[i,6]=4;//Bit 7
      LetSimbEN[i,7]=11;//Bit 8
      //--Польс 1 из 4
      LetSimbEN[i,8]=4;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4 Полюс начала буквы
      //--Вариант Переключателя x1 - 1,x2 - 2,x3 - 3,x4 - 4 , z1 -5 ,z2 - 6,z3 - 7,z4 - 8
      LetSimbEN[i,9]=1;
      //-- Номер симвала из MQL4 Пример , 201, 202, 203
      LetSimbEN[i,10]=97;
      LetSimbEN[i,11]=3;//Sev - 1,Yug -2 ,Vost - 3, Zap - 4 Полюс конца буквы

      Print(LetSimbEN[i,0]);
      Print(LetSimbEN[i,1]);
      Print(LetSimbEN[i,2]);
      Print(LetSimbEN[i,3]);
      Print(LetSimbEN[i,4]);
      Print(LetSimbEN[i,5]);
      Print(LetSimbEN[i,6]);
      Print(LetSimbEN[i,7]);
      Print(LetSimbEN[i,8]);
      Print(LetSimbEN[i,9]);
      Print(LetSimbEN[i,10]);



      //Запись внесённых символов в Массив
      int file_handle1=FileOpen(FileName1,FILE_READ|FILE_WRITE|FILE_BIN);
      //Print("HANDLE ",file_handle13);
      if(file_handle1>0)
        {

         FileSeek(file_handle1,0,SEEK_CUR);

         uint test =FileWriteArray(file_handle1,LetSimbEN,0,WHOLE_ARRAY);
         //Print("WRITED ",test);
         FileClose(file_handle1);


        }

     }


//If Для выбора однопоточности или мултипоточности
   if(Juego==1)
     {

      if(LetraCorriente>-1 && ShowSimb==true)
        {
         for(int Si=0; Si<9999; Si++) // Si номер индекса в массиве
           {
            Print(" StrNum ",CharacterGet," Si ",Si);
            if(LetSimbEN[Si,10]==CharacterGet && LetSimbEN[Si,8]==Game_Direction)//поиск строки по номеру буквы.
              {
int SleeP=StrToInteger(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,0])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,1])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,2])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,3])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,4])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,5])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,6])+".bmp");
               Sleep(SleeP);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,7])+".bmp");
               Sleep(SleeP);
               Print("FIN DE LA LETRA ");//вывести заголовок конец буквы
               ShowSimb=false;
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\ZERO.bmp");
               break;

              }
           }
        }
     }

// Игра Мультипоточная
   if(Juego==2)
     {
      if(LetraCorriente>-1 && ShowSimb==true)
        {
         for(int Si=0; Si<9999; Si++) // Si номер индекса в массиве
           {
            Print(" StrNum ",CharacterGet," Si ",Si);
            if(LetSimbEN[Si,10]==CharacterGet && LetSimbEN[Si,8]==Game_Direction)//поиск строки по номеру буквы.
              {
int SleeP=StrToInteger(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,0])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,1])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,2])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,3])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,4])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,5])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,6])+".bmp");
               Sleep(brts);
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\"+IntegerToString(LetSimbEN[Si,7])+".bmp");
               Sleep(brts);
               Print("FIN DE LA LETRA ");//вывести заголовок конец буквы
               Game_Direction=LetSimbEN[Si,11];//Смена полюса буквы по последнему значению
               ShowSimb=false;
               ObjectSetString(0,obiekt1001,OBJPROP_BMPFILE,"\\Images\\Class-Kubo-16-img\\ZERO.bmp");
               break;

              }
           }
        }
     }






// }
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
