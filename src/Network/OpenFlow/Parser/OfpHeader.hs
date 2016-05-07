module Network.OpenFlow.Parser.OfpHeader where

import           Data.Word
import           Data.Attoparsec.ByteString (Parser, anyWord8)
import           Network.OpenFlow.Parser.Word (anyWord16, anyWord32)
import           Network.OpenFlow.Message (OfpHeader(..))
import           Network.OpenFlow.Parser.OfpType (ofpType)
