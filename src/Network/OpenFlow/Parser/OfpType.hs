module Network.OpenFlow.Parser.OfpType where

import           Control.Monad
import           Data.Word (Word8)
import           Data.Attoparsec.ByteString (Parser, anyWord8, satisfy, (<?>))
import qualified Network.OpenFlow.Message.OfpType as O

ofpType :: Parser O.OfpType
ofpType = (<?> "OfpType") $ do
  ofptM <- fmap fromWord8 $ satisfy isOfpType
  case ofptM of
    Just t  -> return t
    Nothing -> mzero

fromWord8 :: Word8 -> Maybe O.OfpType
fromWord8 = O.ofpType . fromIntegral

isOfpType :: Word8 -> Bool
isOfpType w = 
  case fromWord8 w of
    Just _  -> True
    Nothing -> False
