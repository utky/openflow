module Network.OpenFlow.Message.OfpEcho where

import qualified Data.ByteString as BS

data OfpEchoRequest
    = OfpEchoRequest
    { echoRequestPayload :: BS.ByteString
    } deriving (Show)

data OfpEchoReply
    = OfpEchoReply
    { echoReplyPayload :: BS.ByteString
    } deriving (Show)
