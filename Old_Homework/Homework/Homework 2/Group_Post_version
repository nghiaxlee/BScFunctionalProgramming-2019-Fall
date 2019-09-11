module module_name_must_match_filename
import StdEnv

absolute_value_subtraction :: Int Int -> Int
absolute_value_subtraction x y
| x > y = x-y
| x < y = y-x
| x == y = 0

a_modulus_function :: Int Int -> Int
a_modulus_function x y
| y <= 0 = 0
| otherwise = absolute_value_subtraction x ( y * (x/y))

basically_the_euclidean_algorithm_lol :: Int Int -> Int
basically_the_euclidean_algorithm_lol x y
| y == 0 = x
| otherwise = basically_the_euclidean_algorithm_lol y (a_modulus_function x y)

Start = basically_the_euclidean_algorithm_lol 60 82
//should return 2
//other test input -> test output are as follows below
//42 68 -> 2
//1814274 259896 -> 4998
//2015 837 -> 31