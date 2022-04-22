#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
-- import Turtle                       --
import Data.Char
import Data.Numbers.Primes
import Debug.Trace


is_truncatable_right "" = True
is_truncatable_right xs = isPrime (read xs :: Integer) && is_truncatable_right (init xs)

is_truncatable_left "" = True
is_truncatable_left xs = isPrime (read xs :: Integer) && is_truncatable_left (tail xs)

is_truncatable_ n = n > 10 && isPrime n && is_truncatable_right (show n) && is_truncatable_left (show n)

main = do
  print digits
  print $ sum $ digits
  where digits = take 11 $ filter is_truncatable_ $ primes
