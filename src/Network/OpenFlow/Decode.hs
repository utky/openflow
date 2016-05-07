module Network.OpenFlow.Decode where

import qualified Data.ByteString as B
import           Network.OpenFlow.Message (OfpMessage)
import           Network.OpenFlow.Parser

decode :: B.ByteString -> Either String OfpMessage
decode = parseOnly ofpMessage
