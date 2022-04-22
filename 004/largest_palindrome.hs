#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --

is_palindrome num = reverse num_char == num_char where num_char = show num

main = do
  print $ maximum $ filter is_palindrome all_nums
  where all_nums = [ x*y | x <- three_dig_nums, y <- three_dig_nums]
        three_dig_nums = [999,998..100] :: [Int]
