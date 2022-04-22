#!/usr/bin/env stack
-- stack --install-ghc runghc --package turtle

                                    -- #!/bin/bash
{-# LANGUAGE OverloadedStrings #-}  --
                                    --
import Turtle                       --

remainder n i = head $ dropWhile (is_mult i) $ iterate (flip div i) n
  where is_mult factor n = (mod n factor) == 0

prime_factors i n
  | n <= 1         = []
  | n `mod` i == 0 = [i] ++ prime_factors (succ i) (remainder n i)
  | otherwise      = prime_factors (succ i) n

prime_factors_ = prime_factors 2

largest_prime_factor x = last $ prime_factors_ x

main = do
  let num = 600851475143
  print $ prime_factors_ num
  print $ largest_prime_factor num
