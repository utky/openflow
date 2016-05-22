module Network.OpenFlow.Parser.OfpHello where

import           Debug.Trace (trace)
import           Data.Word
import           Data.Attoparsec.ByteString
import           Network.OpenFlow.Message
import           Network.OpenFlow.Parser.Word (anyWord16, anyWord32)
import           Network.OpenFlow.Parser.TLV

ofpHello :: Parser OfpHello
ofpHello = (<?> "OfpHello") $ OfpHello <$> many' ofpHelloElement

ofpHelloElement :: Parser OfpHelloElement
ofpHelloElement = do
  typ <- anyWord16 <?> "OfpHelloElement type"
  len <- anyWord16 <?> "OfpHelloElement length"
  fixedLength ((fromIntegral len) - 4) (ofpHelloElementValue typ)
  where
    ofpHelloElementValue 1 = OfpHelloVersionBitmap <$> ofpHelloVersionBitMap
    ofpHelloElementValue _ = return UnknownHelloElement

ofpHelloVersionBitMap :: Parser Word32
ofpHelloVersionBitMap = anyWord32
