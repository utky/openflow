module Network.OpenFlow.Message.OfpHello where

import Data.Word

data OfpHello 
    = OfpHello
    { elements :: [OfpHelloElementHeader]
    }

data OfpHelloElementHeader = VersionBitmap { bitmaps :: [Word32] }
