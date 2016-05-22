module Network.OpenFlow.Message.OfpHello where

import Data.Word

data OfpHello 
    = OfpHello
    { ofpHelloElements :: [OfpHelloElement]
    } deriving (Show)

data OfpHelloElement = OfpHelloVersionBitmap { ofpHelloVersionBitmaps :: Word32 }
                     | UnknownHelloElement
                     deriving (Show)
