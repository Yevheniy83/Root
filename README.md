![ROOT INITIALIZATION](https://user-images.githubusercontent.com/60549361/129348378-b449a997-b259-442e-89ab-9febeb785723.png)
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
