module Network.OpenFlow.Parser.OfpMessage where

import           Prelude hiding (take)
import           Control.Monad (fail)
import           Data.Word
import qualified Data.ByteString as B
import           Data.Attoparsec.ByteString
import           Network.OpenFlow.Message (OfpMessage, OfpHeader(..), OfpPayload(..))
import           Network.OpenFlow.Parser.Word (anyWord16, anyWord32)
import           Network.OpenFlow.Parser.TLV
import qualified Network.OpenFlow.Parser.OfpEcho as Echo
import qualified Network.OpenFlow.Parser.OfpHello as Hello

ofpMessage :: Parser OfpMessage
ofpMessage = ofpHeader ofpPayload

-- | Parser for OpwnFlow header.
-- It needs a payload parser.
ofpHeader :: (Word8 -> Parser OfpPayload) -> Parser OfpHeader
ofpHeader payloadParser = do
  ver <- anyWord8 <?> "OfpHeader version"
  typ <- anyWord8 <?> "OfpHeader type"
  len <- anyWord16 <?> "OfpHeader length"
  xid <- anyWord32 <?> "OfpHeader xid"
  pld <- fixedLength (lengthRemainder len) (payloadParser typ)
  return $ OfpHeader ver len xid pld
  where
    lengthRemainder :: Word16 -> Int
    lengthRemainder l = fromIntegral ( l - 8)

ofpPayload :: Word8 -> Parser OfpPayload
-- Hello
ofpPayload 0  = Hello <$> Hello.ofpHello
-- EchoRequest
ofpPayload 2  = EchoRequest <$> Echo.ofpEchoRequest
-- EchoReply
ofpPayload 3  = EchoReply <$> Echo.ofpEchoReply
-- Unknown type
ofpPayload _  = Unknown <$> takeByteString
