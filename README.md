# Root
Lines 2699-2793 -> Binary Converter- "The code transforms the price into a binary code"
* The body [] array writes information about the current session in 3 columns Example session 1 minute
* Column A - filled in with the price - in cases of price slippage, it is filled in with the number 3. Column B is filled with a binary code according to the principle When the price rises up, the price is assigned 1 When the price goes down, the price is assigned 0. In column D, the price slippage is filled in if the price is formed in normal mode, then it is filled 111. Examples of filling can be seen in the generated file. Files route *\ MQL4 \ Files


//----------------------------------------//
Programming goals.
* Studying price behavior based on a Binary code. 
* Writing indicators related to price behavior based on Binary code
