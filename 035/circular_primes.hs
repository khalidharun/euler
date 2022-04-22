#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
-- import Turtle                       --
import Data.Char
import Data.Numbers.Primes
import Debug.Trace

is_prime 0 = False
is_prime 1 = False
is_prime x = all (\i -> 0 /= mod x i) [2..(pred x)]

rotate digits = rotated_chars
  where rotated_chars =  tail $ take (succ size) (cycle digits)
        size = length digits

is_circular_prime x = all isPrime (map read cands)
  where cands = take (length digits) $ iterate rotate digits
        digits = show x

main = do
  print $ take 3 $ iterate rotate (show 123)
  print $ is_circular_prime 123
  print $ is_circular_prime 197
  print $ is_circular_prime 107
  print $ traceShow results (length results)
  where results = filter is_circular_prime ([1,2] ++ [3,5..limit])
        limit   = 1000000
