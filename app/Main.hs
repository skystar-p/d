{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Char8 as B
import System.Environment
import DaumDic

main :: IO ()
main = do
    words <- getArgs
    content <- getContent $ unwords words
    B.putStrLn $ B.intercalate " / " $ parse content
