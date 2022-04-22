#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --

is_mult [] y = False
is_mult [x] y      = y `mod` x == 0
is_mult (x:xs) y = y `mod` x == 0 && is_mult xs y

-- evenly_divisible ns x = all (map is_mult ns) x
--
--

next_factor num i = head $ dropWhile

prime_factors _ 1 = []
prime_factors i n = [next_prime] ++ prime_factors remainder (succ i)

main = do
  print $ is_mult [] 20
  print $ is_mult [1,2,3,4] 12
  print $ is_mult [1,2,3,4] 13
  print $ head $ filter (is_mult [1..20]) [10,20..]
