module Network.OpenFlow.Message.OfpHeader where

import Data.Word (Word32, Word16, Word8)
import qualified Network.OpenFlow.Message.OfpType as OFT

type Xid = Word32

data OfpHeader
    = OfpHeader 
    { version :: Word8
    , ofType :: OFT.OfpType
    , length :: Word16
    , xid :: Xid
    }
