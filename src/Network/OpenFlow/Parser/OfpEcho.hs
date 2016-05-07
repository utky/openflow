module Network.OpenFlow.Parser.OfpEcho where

import           Data.Word
import           Data.Attoparsec.ByteString
import           Network.OpenFlow.Message.OfpEcho (OfpEchoRequest(..), OfpEchoReply(..))


ofpEchoRequest :: Parser OfpEchoRequest
ofpEchoRequest = (<?> "OfpEchoRequest") $ OfpEchoRequest <$> takeByteString

ofpEchoReply :: Parser OfpEchoReply
ofpEchoReply = (<?> "OfpEchoReply") $ OfpEchoReply <$> takeByteString
