module Network.OpenFlow.Parser.OfpMessage where

import           Prelude hiding (take)
import           Control.Monad (fail)
import           Data.Word
import           Data.Attoparsec.ByteString
import           Network.OpenFlow.Message (OfpMessage, OfpHeader(..), OfpPayload(..))
import           Network.OpenFlow.Parser.Word (anyWord16, anyWord32)
import qualified Network.OpenFlow.Parser.OfpEcho as Echo

ofpMessage :: Parser OfpMessage
ofpMessage = ofpHeader

lengthRemainder :: Word16 -> Word16
lengthRemainder len = len - 8

ofpHeader :: Parser OfpHeader
ofpHeader = do
  ver <- anyWord8 <?> "OfpHeader version"
  typ <- anyWord8 <?> "OfpHeader type"
  len <- anyWord16 <?> "OfpHeader length"
  xid <- anyWord32 <?> "OfpHeader xid"
  let readLength = fromIntegral (lengthRemainder len)
  rest <- take readLength <?> ("OfpHeader payload: length " ++ (show readLength))
  let payloadParser = (ofpPayload typ) <* endOfInput
      parsedPayload = parseOnly payloadParser rest
  case parsedPayload of
    Left msg  -> fail msg
    Right pld -> return $ OfpHeader ver len xid pld

ofpPayload :: Word8 -> Parser OfpPayload
-- Hello
ofpPayload 0  = Hello <$> undefined
-- EchoRequest
ofpPayload 2  = EchoRequest <$> Echo.ofpEchoRequest
-- EchoReply
ofpPayload 3  = EchoReply <$> Echo.ofpEchoReply
-- Unknown type
ofpPayload _  = Unknown <$> takeByteString
