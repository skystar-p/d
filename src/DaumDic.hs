{-# LANGUAGE OverloadedStrings #-}
module DaumDic (
    getContent
    ) where

import Network.HTTP.Req
import qualified Data.ByteString.Char8 as B

getURL = "alldic.daum.net"

getContent :: String -> IO B.ByteString
getContent word = runReq defaultHttpConfig $ do
    r <- req GET
        (https getURL /: "search.do")
        NoReqBody
        bsResponse
        ("q" =: word)
    return (responseBody r)
