{- Little endian byte string parser
-}
module Network.OpenFlow.Parser.Word where

import           Control.Applicative
import           Data.Attoparsec.ByteString
import           Data.Bits
import           Data.Word

-- |
-- >>> parseTest anyWord16 (pack [0x01, 0x02])
-- Done "" 18
anyWord16 :: Parser Word16
anyWord16 = do
  f <- fmap fromIntegral anyWord8
  s <- fmap fromIntegral anyWord8
  return $ shiftL 8 f .|. s

anyWord32 :: Parser Word32
anyWord32 = do
  f <- fmap fromIntegral anyWord16
  s <- fmap fromIntegral anyWord16
  return $ shiftL 16 f .|. s

