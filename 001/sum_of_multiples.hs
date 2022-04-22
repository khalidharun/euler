#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --
                                    --
-- main = echo "Hello, world!"         -- echo Hello, world!
main = do
  print $ sum [x | x <- [1..1000-1], 0 == x `mod` 3 || 0 == x `mod` 5]
