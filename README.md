Gratitude!

Dear friends, first of all I express my gratitude to Mirzakorim Sanokulovich Norbekov for creating TinTuit. This wonderful device in my hands laid the foundation for the development of a mathematical algorithm for measuring market relations on the stock exchange. The algorithm has been developed by me for 7 years and has incorporated such principles as Binary code "Tintuit"
Royal crown "Image of the spiral crown of the Queen of Spain"
Sunflower "Natural growth"
I am teaching a computer to analyze the market based on two principles. Binary code, in other words, the range of prices and the manifestation of the golden section.
I invite everyone to get acquainted with TinTuit at the following link https://tintuit.ru/
To view the image of the crown, follow this link https://www.joyeriaonline.com/blog/las-tiaras-de-la-reina-de-espana/
To learn more about Sunflower follow the following link https://en.m.wikipedia.org/wiki/Helianthus
I am also grateful to the teachers of secondary school 22 in the city of Kirovograd for the knowledge they invested in me in the period 1990-2000 https://my-school.kr.ua/ 
and to the developers of the MQL4 programming environment https://docs.mql4.com/ru

IMAGES!

![Скрипт](https://user-images.githubusercontent.com/60549361/129349476-c919b3b2-c0fe-4e92-97c5-38d0d4cf09dd.png)

![Diapositiva2](https://user-images.githubusercontent.com/60549361/129445484-539e4546-01a4-4bff-a6d6-151183d7f889.PNG)

![Diapositiva3](https://user-images.githubusercontent.com/60549361/129445492-dc37d052-27e8-4716-a667-e9a0995a08da.PNG)

![Diapositiva4](https://user-images.githubusercontent.com/60549361/129449236-15c19d53-33e5-432c-ad43-ae800e9a45ba.PNG)

![Diapositiva5](https://user-images.githubusercontent.com/60549361/129449239-76c48525-39dd-453d-8852-926ea16a4d9b.PNG)

![Girasol](https://user-images.githubusercontent.com/60549361/158072512-a1919ef1-3226-4fb2-8e0a-56c2d1466b35.png)

# Root
Lines 2699-2793 -> Binary Converter- "The code transforms the price into a binary code"
* The body [] array writes information about the current session in 3 columns Example session 1 minute
* Column A - filled in with the price - in cases of price slippage, it is filled in with the number 3. Column B is filled with a binary code according to the principle When the price rises up, the price is assigned 1 When the price goes down, the price is assigned 0. In column D, the price slippage is filled in if the price is formed in normal mode, then it is filled 111. Examples of filling can be seen in the generated file. Files route *\ MQL4 \ Files
* BID is used to transform the price into a binary code. You can also conduct transformation studies by ASK
* The indicators are calculated in the conditions of a session change and are included in the function from the line 479
* Expanding the collected data from vertical to horizontal position to facilitate analysis and writing to a binary file.Correction of the formation of a binary chain when the current session is closed and a new session is opened.Starting from the line 484 End of recording 691. 
The received data is recorded in 3 binary files 
BodyHorizont_Bin.bin
BodyHorizont_Price.bin
BodyHorizont_Time.bin


//----------------------------------------//
Programming goals.
* Studying price behavior based on a Binary code. 
Formulas: 
**  The sum of units in one session. Sum of zeros in one session. Variables receiving knowledge. String 2786 & 2687
**  BigPipsFinder -
the indicator is built on the principle of price reference 1 to price 2. Price gets 2 forces "Bullish and Bearish" Each force has 2 polarities "+ and -" The sum of polarities at the end of the session and shows the price that was referenced during the trading session. function start at line 733, end function 1161

* Writing indicators related to price behavior based on Binary code.

Index Videos Youtube:
Breafing Root - https://www.youtube.com/watch?v=DbKESPR435Y 
