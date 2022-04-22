#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --
import Data.Char

factorial 0 = 1
factorial x = x * factorial (pred x)

sum_of_factorial x = sum $ map (factorial . digitToInt) (show x)

is_curious x = x == sum_of_factorial x

main = do
  print $ is_curious 145
  print $ is_curious 40585
  print $ is_curious 40730
  print $ map factorial [0..9]
  print $ filter is_curious [3..100000]
  print $ sum $ filter is_curious [3..100000]
