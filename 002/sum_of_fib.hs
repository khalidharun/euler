#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --

fib 1 = 1
fib 2 = 1
fib x = fib (x-1) + fib(x-2)

main = do
  print $ sum $ filter even $ takeWhile (< (floor 4e6)) $ map fib [1..]
