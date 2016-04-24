module Network.OpenFlow.Message.OfpPort where

import Data.Word (Word32, Word16, Word8)
import qualified Data.Text as T

type HwAddr = (Word8, Word8, Word8, Word8, Word8, Word8)

data OfpPort
    = OfpPort
    { portNo :: Word32
    , pad :: (Word8, Word8, Word8, Word8)
    , hwAddr :: HwAddr
    , name :: T.Text -- ^max 16 characters
    , config :: Word32
    , state :: Word32
    , curr :: Word32
    , advertised :: Word32
    , supported :: Word32
    , peer :: Word32
    , currSpeed :: Word32
    , maxSpeed :: Word32
    }

data OfpPortConfig
    = OfpPortConfig
    { portDown :: Bool -- ^ 1 << 0
    , noRecv :: Bool -- ^ 1 << 2
    , noFwd :: Bool -- ^ 1 << 5
    , noPacketIn :: Bool -- ^ 1 << 6
    }

data OfpPortState
    = OfpPortState
    { linkDown :: Bool -- ^ 1 << 0
    , blocked :: Bool  -- ^ 1 << 1
    , live :: Bool -- ^ 1 << 2
    }

data OfpPortNo
    = OfppMax         -- ^ 0xffffff00
    | OfppInPort      -- ^ 0xfffffff8
    | OfppTable       -- ^ 0xfffffff9
    | OfppNormal      -- ^ 0xfffffffa
    | OfppFlood       -- ^ 0xfffffffb
    | OfppAll         -- ^ 0xfffffffc
    | OfppController  -- ^ 0xfffffffd
    | OfppLocal       -- ^ 0xfffffffe
    | OfppAny         -- ^ 0xffffffff
