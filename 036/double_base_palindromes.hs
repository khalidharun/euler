#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --
import Numeric
import Data.Char

as_base k = showIntAtBase k intToDigit

is_palindrome x = x == reverse x

is_double_base_palindrome x = all is_palindrome [as_base 2 x "", as_base 10 x ""]

main = do
  print $ sum $ filter is_double_base_palindrome [1..999999]
