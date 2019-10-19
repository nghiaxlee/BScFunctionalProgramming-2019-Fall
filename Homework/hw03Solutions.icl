module hw03Solutions
import StdEnv

/*
Write a function that takes a list of numbers and
breaks it into two lists with alternating members from
the original list.

For example: [3,5,6,8,7,9] -> [ [3,6,7], [5,8,9] ]
*/
splitList :: [Int] -> [[Int]]
splitList bigList = splitAux bigList [[],[]]

splitAux niceList [a,b]
| myLength == length niceList = [a,b]
| isEven myLength = splitAux niceList [a++[niceList!!myLength],b]
| isOdd myLength = splitAux niceList [a,b++[niceList!!myLength]]
    where
        myLength = length a + length b

splitListShort bigList = [ [x\\x<-bigList&y<-[1..]|isOdd y],[x\\x<-bigList&y<-[1..]|isEven y] ]

//Start = splitList [56,3,87,5,234,5,0,-4] //[[56,87,234,0],[3,5,5,-4]]
//Start = splitList [1,4..50] //[[1,7,13,19,25,31,37,43,49],[4,10,16,22,28,34,40,46]]
//Start = splitList [420] //[[420],[]]
//Start = splitList []//[[],[]]

/*
Write a function that takes a list of numbers and
adds the first element, subtracts the second element,
adds the third element, subtracts the fourth element,
in this alternating repetition.

For example: [2,3,4,5,6,7] -> 2-3+4-5+6-7 = -3
*/
alternatingSum :: [Int] -> Int
alternatingSum [] = 0
alternatingSum niceList = altAux niceList 0

altAux niceList meh
| meh == length niceList = 0
| isEven meh = niceList!!meh + altAux niceList (meh+1)
| isOdd meh = (-1*(niceList!!meh)) + altAux niceList (meh+1)

alternatingSumShort bigList = sum[x*((-1)^y)\\x<-bigList&y<-[0..]]

//Start = alternatingSum [2..7] //-3
//Start = alternatingSum [45,-5,63,46,-345,4321] //-4599
//Start = alternatingSum [] //0

/*
Write a function that converts binary numbers to decimal numbers.

For example: 10010 = 2^4 + 2^1 = 18
*/
binaryToDecimal :: Int -> Int
binaryToDecimal bin = binAux (numToList bin) 0

binAux lol hi
| isEmpty lol = 0
= last lol * (2^hi) + binAux (init lol) (hi+1)

binaryToDecimalShort bin = sum[x*(2^y)\\x<-reverse(numToList bin)&y<-[0..]]

numToList n
| n < 10 = [n]
= numToList(n/10) ++ [n rem 10]

//Start = binaryToDecimal 10010 //18
//Start = binaryToDecimal 1010101010101 //5461