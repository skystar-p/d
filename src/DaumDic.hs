{-# LANGUAGE OverloadedStrings #-}
module DaumDic (
    getContent,
    parse
    ) where

import Network.HTTP.Req
import Text.HTML.TagSoup
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

parse :: B.ByteString -> [B.ByteString]
parse b = getTexts . getCardResultSections $ parseTags b
    where getCardResultSections = sections (~== ("<li>" :: String)) .
            takeWhile (~/= ("</ul>" :: String)) . dropWhile (~/= ("<ul class=list_search>" :: String))
          getTexts = map (innerText . takeWhile (~/= ("</span>" :: String)) . dropWhile (~/= ("<span class=txt_search>" :: String)))
