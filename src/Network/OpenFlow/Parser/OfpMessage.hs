module Network.OpenFlow.Parser.OfpMessage where

import           Prelude hiding (take)
import           Control.Monad (fail)
import           Data.Word
import qualified Data.ByteString as B
import           Data.Attoparsec.ByteString
import           Network.OpenFlow.Message (OfpMessage, OfpHeader(..), OfpPayload(..))
import           Network.OpenFlow.Parser.Word (anyWord16, anyWord32)
import qualified Network.OpenFlow.Parser.OfpEcho as Echo

ofpMessage :: Parser OfpMessage
ofpMessage = ofpHeader

-- | Calculate payload length from length field.
-- length - 8 (ofpHeader length)
lengthRemainder :: Word16 -> Int
lengthRemainder len = fromIntegral (len - 8)

-- | fixedLength i p
-- read i octets and use them as input for running parser p.
fixedLength :: Int -> Parser a -> Parser a
fixedLength len parser = do
  bytes <- take len
  case parseOnly (parser <* endOfInput) bytes of
    Left err     -> parser <?> err
    Right parsed -> return parsed

ofpHeader :: Parser OfpHeader
ofpHeader = do
  ver <- anyWord8 <?> "OfpHeader version"
  typ <- anyWord8 <?> "OfpHeader type"
  len <- anyWord16 <?> "OfpHeader length"
  xid <- anyWord32 <?> "OfpHeader xid"
  pld <- fixedLength (lengthRemainder len) (ofpPayload typ)
  return $ OfpHeader ver len xid pld

ofpPayload :: Word8 -> Parser OfpPayload
-- Hello
ofpPayload 0  = Hello <$> undefined
-- EchoRequest
ofpPayload 2  = EchoRequest <$> Echo.ofpEchoRequest
-- EchoReply
ofpPayload 3  = EchoReply <$> Echo.ofpEchoReply
-- Unknown type
ofpPayload _  = Unknown <$> takeByteString
