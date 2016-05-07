module Network.OpenFlow.Message.OfpEcho where

import qualified Data.ByteString as BS

data OfpEchoRequest
    = OfpEchoRequest
    { echoPayload :: BS.ByteString
    }

data OfpEchoReply
    = OfpEchoReply
    { echoReplyPayload :: BS.ByteString
    }
