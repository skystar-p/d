{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Char8 as B
import DaumDic

main :: IO ()
main = do
    content <- getContent "surveillance"
    B.putStrLn content
