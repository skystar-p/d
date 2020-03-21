{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.ByteString.Char8 as B
import Control.Monad (when)
import System.Environment
import System.Exit (die)
import DaumDic

main :: IO ()
main = do
    words <- getArgs
    when (null words) $ die "usage: d <word>"
    content <- getContent $ unwords words
    B.putStrLn $ B.intercalate " / " $ parse content
